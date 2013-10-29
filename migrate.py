from __future__ import print_function
from pprint import pprint
from string import split, strip
from rules import mappingOnly, insertOnly, newTables
import sys


def getMappings(x):
    return mappingOnly.get(x, False)


def injectValue(insert, mapping):
    chunks = split(insert, '(', 2)
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
    try:
        fields, rows = insert.split(') VALUES (')
    except:
        print('Failed value parsing: %s ... %s' % (insert[:30], insert[-10:]))
        exit()
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
    rest[-1] = rest[-1].strip(');')
    body = split(rest[0], '/*')
    body = split(body[0], ';\n')[0]
    return {
        'body': body,
        'name': strip(tableName, ' '),
        'inserts': parseInserts(x),
        'rest': rest
    }

def parseInserts(x):
    lines = x.split('\n')
    inserts = filter(lambda x: x[:11] == 'INSERT INTO', lines)
    return inserts


def migrateTable(x):
    mapping = getMappings(x['name'])
    if not mapping:
        return x
    origName = x['name']
    x['name'] = mapping.get('name', origName)
    x['inserts'] = map(lambda i: i.replace(origName, x['name']), x['inserts'])
    x = handleBodyMapping(x, mapping)
    x = handleColumnMapping(x, mapping)
    x = handleColumnUpdates(x, mapping)
    return x


def handleBodyMapping(x, mapping):
    if mapping.get('remove', False):
        body = x['body'].split('\n')
        for col in mapping['remove']:
            print('removing %s' % col)
            body = filter(lambda x: col not in x, body)
        x['body'] = '\n'.join(body)
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


def showTable(x, f):
    print("creating new table: %s" % x['name'])
    print("DROP TABLE if exists %s;" % x['name'], file=f)
    print("CREATE TABLE %s (\n%s;\n" % (x['name'], x['body']), file=f)

def showInserts(x, f):
    if len(x['inserts']) > 0:
        print("Building inserts: %s" %  x['name'])
        print('DELETE FROM %s;' % x['name'], file=f)
    for insert in x['inserts']:
        if insert[-2:] != ");":
            insert = "%s);" % insert
        else:
            insert = "%s" % insert
        try:
            print(insert, file=f)
        except:
            print('Problem: %s...%s' % (insert[:30], insert[-30:]))

if __name__ == '__main__':
    database = 'tf_framework'
    infile, outfile = sys.argv[1], open(sys.argv[2], 'w')

    sql = open(infile).read()
    tables = split(sql, 'CREATE TABLE ')
    tables = tables[1:]
    tables = filter(lambda x: split(x, '\n'), tables)
    tables = map(parseTable, tables)
    tables = map(migrateTable, tables)

    print('USE %s;' % database, file=outfile)
    print('SET FOREIGN_KEY_CHECKS = 0;', file=outfile)

    [showTable(x, outfile) for x in filter(lambda x: x['name'] in newTables, tables)]
    [showInserts(x, outfile) for x in filter(lambda x: x['name'] in mappingOnly, tables)]
    [showInserts(x, outfile) for x in filter(lambda x: x['name'] in insertOnly, tables)]

    print('SET FOREIGN_KEY_CHECKS = 1;', file=outfile)
