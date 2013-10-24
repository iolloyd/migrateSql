from pprint import pprint
from string import split, strip
from rules import mappingOnly, legacyOnly, insertOnly


def getMappings(x):
    return mappingOnly.get(x, False)

def addMissingColumns(table, mapping):
    table['inserts'] = map(lambda x, m=mapping: injectValue(x, m), table['inserts'])
    return table

def removeColumns(table, m):
    table['inserts'] = map(lambda x, m=m: removeValue(x, m), table['inserts'])
    return table

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
    fields, values = insert.split(') VALUES (')
    pre, fields = fields.split('(', 1)
    fields = map(strip, fields.split(','))
    indexes = map(lambda x, f=fields: f.index('`%s`' % x), mapping['remove'])
    for w in mapping['remove']:
        fields.remove('`%s`' % w)
    values = values.split('),(')
    newRows = []
    for row in values:
        try:
            for idx in indexes:
                row = row.split(",")
                row.remove(row[idx])
                row = ','.join(row)
        except AttributeError:
            print 'oops:', row
            exit()
        newRows.append(row)
    return "%s (%s) VALUES (%s" % (pre, ','.join(fields), '),('.join(newRows))


def parseTable(x):
    tableName, rest = split(x, '(\n')
    tableName = tableName.translate(None, '`')
    rest = split(rest, ');\n')
    body = split(rest[0], '/*')
    body = split(body[0], ';\n')[0]
    inserts = map(lambda line: "INSERT INTO %s)" % line, split(rest[0], "INSERT INTO")[1:])
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
    if 'columns' in mapping.keys():
        for k, v in mapping['columns'].items():
            x['body'] = x['body'].replace(k, v)
            x['inserts'] = map(lambda i: i.replace(k, v), x['inserts'])
    return x


def handleColumnUpdates(x, mapping):
    if mapping.get('add', False):
        x = addMissingColumns(x, mapping)
    if mapping.get('remove', False):
        x = removeColumns(x, mapping)
    return x


def showTable(x):
    if len(x['inserts']) > 0:
        print "DROP TABLE if exists %s;" % x['name']
        print "CREATE TABLE %s (\n%s;\n" % (x['name'], x['body'])


def showInserts(x):
    for table in x['inserts']:
        print 'DELETE FROM %s;' % x['name']
        print "%s;" % table


justUseful = lambda x: split(x, '\n')
label = lambda tableName, mapping: mapping.get(tableName, tableName)
isInsert = lambda x: len(x.split('INSERT IGNORE INTO')) > 1
hasInserts = lambda t: len(t['inserts']) > 0
blacklist = ['alerts', 'emailQueue']
ignoreBlacklist = lambda t: t['name'] not in blacklist

filename = 'fullDump.sql'
database = 'tf_framework'
pivotTables = ['orderAddresses']

print 'USE %s;' % database
print 'SET FOREIGN_KEY_CHECKS = 0;'

sql = open(filename).read()
tables = split(sql, 'CREATE TABLE ')
tables = tables[1:] # Ditch the header comments
tables = filter(justUseful, tables) # Get rid of other comments
tables = map(parseTable, tables) # Create table objects
tables = filter(hasInserts, tables) # Ignore tables without inserts
tables = filter(ignoreBlacklist, tables) # currently ignores 'alerts'
tables = map(migrateTable, tables) # map correct table and column namesa

[showInserts(x) for x in filter(lambda x: x['name'] in mappingOnly, tables)]

print 'SET FOREIGN_KEY_CHECKS = 1;'
