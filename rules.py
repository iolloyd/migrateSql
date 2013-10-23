mappings = {
        'acl': {
            'name': 'acl'
            },
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
        'orders': {
            'populate': [
                {
                    'rule': 'orders.orderID = billerTransactionRequests.orderID',
                    'columns': {
                        'original': ['shippingAddressID', ],
                        'new': ['shippingAddressID', ],
                        }
                    }
                ]
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
            'populate': [
                {
                    'rule': 'orderAddresses.customerAddressID = customerAddress.customerAddressID',
                    'columns': {
                        'original': ['firstName', 'lastName', 'address1', 'address2', 'city', 'state', 'country', 'zip', 'phone', 'status', 'created', 'modified'],
                        'new': ['firstName', 'lastName', 'address1', 'address2', 'city', 'state', 'country', 'zip', 'phone', 'status', 'created', 'modified']
                        }
                    },
                {
                    'rule': 'orderAddresses.orderAddressID = billerTransactionRequests.id',
                    'columns': {
                        'original': ['billingAddressID'],
                        'new': ['billingAddressID']
                        }
                    }
                ]
            },
        'orderQuotes': {
                'name': 'orderInvoices'
                },
        'storeCoupons': {
                'add': {
                    'autoEnable': 0,
                    'approval_code': ''
                    },
                },
        'tagDomains': {
                'columns': {
                    'targetURL': 'defaultURL'
                    }
                }
        }
