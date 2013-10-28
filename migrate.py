from pprint import pprint
from string import split, strip
from rules import mappingOnly, legacyOnly, insertOnly
import argparse

def getMappings(x):
    return mappingOnly.get(x, False)


def injectValue(insert, mapping):
    chunks= split(insert, '(', 2)
    for newColumn, newValue in mapping['add'].items():
        columns = "`%s`, %s" % (newColumn, chunks[1])
        rows = chunks[2].split('),(')
        if type(1) == type(newValue):
            rows = map(lambda x: "%s,%s" % (newValue, x), rows)
        else:
            rows = map(lambda x: "'%s',%s" % (newValue, x), rows)
    rows = map(lambda x: "(%s)" % x, rows)
    rows = ','.join(rows)
    result = "%s(%s %s" % (chunks[0], columns, rows)
    result = result.replace('))', ')')
    return result


def removeValue(insert, mapping):
    fields, rows = insert.split(') VALUES (')
    pre, fields = fields.split('(', 1)
    fields = map(strip, fields.split(','))
    indexes = map(lambda x: fields.index('`%s`' % x), mapping['remove'])
    for w in mapping['remove']:
        fields.remove('`%s`' % w)
    rows = rows.split('),(')
    newRows = []
    for row in rows:
        for idx in indexes:
            row = removeFromRow(row, idx)
        newRows.append(row)
    return "%s (%s) VALUES (%s" % (pre, ','.join(fields), '),('.join(newRows))


def removeFromRow(row, idx):
    row = row.split(",")
    row.pop(idx)
    return ','.join(row)


def changeColumns(table, mapping, f):
    table['inserts'] = map(lambda x, m=mapping: f(x, m), table['inserts'])
    return table


def parseTable(x):
    tableName, rest = split(x, '(\n', 1)
    tableName = tableName.translate(None, '`')
    rest = split(rest, ');\n')
    body = split(rest[0], '/*')
    body = split(body[0], ';\n')[0]
    inserts = map(lambda line: "INSERT INTO %s" % line, split(rest[0], "INSERT INTO")[1:])
    return {
        'body': body,
        'name': strip(tableName, ' '),
        'inserts': inserts,
        'rest': rest
    }


def migrateTable(x):
    mapping = getMappings(x['name'])
    if not mapping:
        return x
    origName = x['name']
    x['name'] = mapping.get('name', x['name'])
    x['inserts'] = map(lambda i: i.replace(origName, x['name']), x['inserts'])
    x = handleColumnMapping(x, mapping)
    x = handleColumnUpdates(x, mapping)
    return x


def handleColumnMapping(x, mapping):
    if mapping.get('columns', False):
        for k, v in mapping['columns'].items():
            x['body'] = x['body'].replace(k, v)
            x['inserts'] = map(lambda i: i.replace(k, v), x['inserts'])
    return x


def handleColumnUpdates(x, mapping):
    if mapping.get('add', False):
        x = changeColumns(x, mapping, injectValue)
    if mapping.get('remove', False):
        x = changeColumns(x, mapping, removeValue)
    return x


def showTable(x):
    print "DROP TABLE if exists %s;" % x['name']
    print "CREATE TABLE %s (\n%s;\n" % (x['name'], x['body'])


def showInserts(x):
    for insert in x['inserts']:
        print 'DELETE FROM %s;' % x['name']
        insert = "%s);" % insert
        print insert

database = 'tf_framework'

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Migrate from legacy to framework', version='%(prog)s 1.0')
    parser.add_argument('-i', type=str, required=True)
    parser.add_argument('-o', type=str, required=True)
    args = parser.parse_args()
    infile = args.i
    outfile = args.o

    sql = open(infile).read()
    tables = split(sql, 'CREATE TABLE ')
    tables = tables[1:] # Ditch the header comments
    tables = filter(lambda x: split(x, '\n'), tables) # Get rid of other comments
    tables = map(parseTable, tables) # Create table objects
    tables = map(migrateTable, tables) # map correct table and column names

    print 'USE %s;' % database
    print 'SET FOREIGN_KEY_CHECKS = 0;'


    [showTable(x) for x in filter(lambda x: x['name'] in legacyOnly, tables)]
    [showInserts(x) for x in filter(lambda x: x['name'] in insertOnly, tables)]
    [showInserts(x) for x in filter(lambda x: x['name'] in mappingOnly, tables)]

    print 'SET FOREIGN_KEY_CHECKS = 1;'
