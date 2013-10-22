from pprint import pprint
from string import split, strip

def getMappings(x):
    """
    add any tables which have a different name or different
    column names in the new database.

    Example:
    the table 'foo' in the legacy database is called booyaka in
    the new database and has one column 'buk' renamed to 'zak'.

    mappings = {
        'foo': { 'name': 'booyaka',
            'columns': { 'buk': 'zak' }
        }
    }
    """
    mappings = {
        'invoices': {
            'name': 'orderInvoices'
            },
        'addresses': {
            'name': 'orderAddresses'
            },
    }
    if x in mappings.keys():
        return mappings[x]
    return None

def justUseful(x):
    lines = split(x, '\n')
    return lines
    return ''.join(lines)

label        = lambda x, mapping: mapping.get(x, x)
isInsert     = lambda x: len(x.split('INSERT INTO')) > 1
hasInserts   = lambda x: len(x['inserts']) > 0
blacklist = ['alerts', 'emailQueue']
ignoreBlacklist = lambda x: x['name'] not in blacklist

def parseTable(x):
    tableName, rest = split(x, '(\n')
    tableName = tableName.translate(None, '`')
    rest = split(rest, ');\n')
    body = split(rest[0], '/*')
    body = split(body[0], ';\n')[0]
    inserts = map(lambda x: "INSERT INTO %s" % x, split(rest[0], "INSERT INTO")[1:])
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
    if 'columns' not in mapping.keys():
        return x
    for k, v in mapping['columns'].items():
        x['body'] = x['body'].replace(k, v)
        x['inserts'] = map(lambda i: i.replace(k, v), x['inserts'])
    return x

def showTable(x):
    if len(x['inserts']) > 0:
        print "DROP TABLE if exists %s;" % x['name']
        print "CREATE TABLE %s (\n%s;\n" % (x['name'], x['body'])

    for x in x['inserts']:
        print "%s);" % x
"""Enter sql dump filename and new database name
"""
filename = 'fullDump.sql'
database = 'tf_framework'

print 'use %s;' % database

print 'set foreign_key_checks=0;'
sql = open(filename).read()
tables = split(sql, 'CREATE TABLE ')
tables = tables[1:] # Ditch the header comments
tables = filter(justUseful, tables) # Get rid of other comments
tables = map(parseTable, tables) # Create table objects
tables = filter(hasInserts, tables) # Ignore tables without inserts
tables = filter(ignoreBlacklist, tables) # currently ignores 'alerts'
tables = map(migrateTable, tables) # map correct table and column names

for x in tables:
    showTable(x)


