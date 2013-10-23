from pprint import pprint
from string import split, strip


def getMappings(x):
    mappings = {
        'billerActiveCurrencies': {
            'columns': {
                'default': 'is_default'
            }
        },
        'clients': {
            'columns': {
                'APIKey': 'apiKey'
            },
        },
        'languages': {
            'columns': {
                'languageID': 'id'
            },
            'add': {
                'title': ''
            },
        },
        'orderItems': {
            'add': {
                'baseValue': ''
            }
        },
        'orderAddresses': {
            'name': 'order_addresses',
            'columns': {
                'orderAddressID': 'order_address_id',
                'orderID': 'order_id',
                'customerAddressID': 'customer_address_id',
            },
            'populate': {
                    'rule': 'customerAddresses.customerAddressID = customerAddress.customerAddressID',
                    'columns': {
                        'original': ['firstName', 'lastName', 'address1', 'address2', 'city', 'state', 'country', 'zip', 'phone', 'status', 'created', 'modified'],
                        'new': ['firstName', 'lastName', 'address1', 'address2', 'city', 'state', 'country', 'zip', 'phone', 'status', 'created', 'modified']
                    }
            },
        },
        'storeCoupons': {
            'add': {
                'requiredProducts': ''
            },
        }
    }

    if x in mappings.keys():
        return mappings[x]
    return None


justUseful = lambda x: split(x, '\n')
label = lambda tableName, mapping: mapping.get(tableName, tableName)
isInsert = lambda x: len(x.split('INSERT INTO')) > 1
hasInserts = lambda t: len(t['inserts']) > 0
blacklist = ['alerts', 'emailQueue']
ignoreBlacklist = lambda t: t['name'] not in blacklist

def insertSelect(mapping, name):
    stmt = "INSERT INTO {tableA} ({colsA}) SELECT {colsB} FROM {tableB} WHERE {rule};"
    sql = stmt.format(
        tableA = name,
        tableB = mapping.get(name, name),
        colsA  = ','.join(mapping['columns']['original']),
        colsB  = ','.join(mapping['columns']['new']),
        rule  = mapping['rule']
    )
    print sql

def addMissingColumns(table, mapping):
    m = mapping['add']
    table['inserts'] = map(lambda x, m=m: injectValue(x, m), table['inserts'])
    return table

def injectValue(insert, mapping):
    chunks= split(insert, '(', 2)
    for newColumn, newValue in mapping.items():
        chunks[1] = "`%s`, %s" % (newColumn, chunks[1])
        if type(1) == type(newValue):
            chunks[2] = "%s, %s" % (newValue, chunks[2])
        else:
            chunks[2] = "'%s', %s" % (newValue, chunks[2])
    chunks[1] = "(%s" % chunks[1]
    chunks[2] = "(%s" % chunks[2]
    return ''.join(chunks)

def parseTable(x):
    tableName, rest = split(x, '(\n')
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
    if 'columns' not in mapping.keys():
        return x
    for k, v in mapping['columns'].items():
        x['body'] = x['body'].replace(k, v)
        x['inserts'] = map(lambda i: i.replace(k, v), x['inserts'])

    if mapping.get('add', False):
        x = addMissingColumns(x, mapping)
    return x


def showTable(x):
    if len(x['inserts']) > 0:
        print "DROP TABLE if exists %s;" % x['name']
        print "CREATE TABLE %s (\n%s;\n" % (x['name'], x['body'])

def showInserts(x):
    for table in x['inserts']:
        print "%s);" % table

filename = 'fullDump.sql'
database = 'tf_framework'
pivotTables = ['orderAddresses']

print 'use %s;' % database

print 'SET FOREIGN_KEY_CHECKS = 0;'

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

for x in tables:
    showInserts(x)

for x in pivotTables:
    insertSelect(getMapping(x), x)

print 'SET FOREIGN_KEY_CHECKS = 1;'
