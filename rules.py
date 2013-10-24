mappings = {
    'billerActiveCurrencies': {
        'columns': {
            'default': 'is_default'
        }
    },

    'billerCardTypes': {
        'add': {
            'key': ''
        }
    },

    'billerPaymentDetails': {
        'populate': [
            {
                'rule': 'WHERE ',
                'columns': {
                    'original' : [
                        'billerPaymentDetailID' ,
                        'customerID' ,
                        'cardNumber' ,
                        'cardExpiryMonth',
                        'cardExpiryYear' ,
                        'billerCardTypeID' ,
                        'storedbillerID' ,
                        'active' ,
                    ],
                    'new' : [
                        'billerPaymentDetailID' ,
                        'customerID' ,
                        'cardNumber' ,
                        'cardExpiryMonth',
                        'cardExpiryYear' ,
                        'billerCardTypeID' ,
                        'billerID' ,
                        'active' ,
                    ],
                }
            }
        ]
    },

    'clients': {
        'columns': {
            'APIKey': 'apiKey'
        },
    },
    'customerAddresses': {
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
                'rule': 'WHERE orders.orderID = billerTransactionRequests.orderID',
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
                'rule': 'WHERE orderAddresses.customerAddressID = customerAddress.customerAddressID',
                'columns': {
                    'original': [],
                    'new': [],
                    }
                },
            {
                'rule': 'WHERE orderAddresses.orderAddressID = billerTransactionRequests.id',
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
    'orderShipments': {
            'populate': {
                'rule': 'WHERE orderShipments.orderID=order.orderID',
                'columns': {
                    'original': [],
                    'new': []
                }
            }
    },
    'productRanges': {
        'add': {
            'name': ''
        }
    },
    'storeCoupons': {
        'add': {
            'approval_code': ''
        },
    },
    'storeCouponUses': {
        'columns': {
            'transactionRequestID': 'orderID'
        },
    },
    'tagDomains': {
        'columns': {
            'targetURL': 'defaultURL'
        }
    }
}

legacyOnly = [
    'acl',
    'aclGroups',
    'aclPermissions',
    'aclRoles', 'customFieldBindings',
    'emailQueue',
    'invoices',
    'ipranges',
    'productReviews',
    'promotionRulesMeta',
]

insertOnly = [
    'agencies',
    'billerCards',
    'billerCosts',
    'billerCurrencies',
    'billerCurrencyRates',
    'billers',
    'billerStoredDetails',
    # 'billerTransactionRequests',
    'billerTransactions',
    'customerAuthentication',
    'customerBlacklists',
    'customers',
    'customFieldBindings',
    'customFields',
    'handsetProviderDevices',
    'handsetProviders',
    'orderAddresses',
    'orderItems',
    'productCategories',
    'productCategoryValues',
    'productDefaultFields',
    'productFields',
    'productFieldValues',
    'productImageGroups',
    'productImages',
    'products',
    'promotionRewardPriceDiscounts',
    'promotionRewards',
    'promotionRules',
    'promotions',
    'storeCategories',
    'storeCategoryValues'
    'storeCountryBlacklists',
    'storeErrorStrings',
    'storeImageGroups',
    'storeImages',
    'storeProducts',
    'storeRegionCurrencies',
    'storeRegions',
    'stores',
    'storeStrings',
    'storeThemes',
    'tagDomains',
    'tagLocations',
    'tagRedirectRules',
    'tagRedirects',
    'tags',
    'tagScans',
    'transactionLogs',
    'translations',
    'users',
]
