mappingOnly = {
    'orders': {
        'remove': ['insuranceCost', 'packingCost', 'shippingCost', 'handlingCost', 'deliveryDate', 'shippingDate', 'shipper', 'details', 'shipwireID', 'warehouseID', 'shipwireReferenceID', 'trackingID', 'trackingUrl'],
    },
    'billerActiveCurrencies': {
        'columns': {
            'default': 'is_default'
        }
    },
    'billerCardTypes': {
    },
    'billerPaymentDetails': {
        'remove': ['cardType', 'cardCVV'],
        'columns': {
            'storedBillerID': 'billerID'
        },
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
        },
    'orderItems': {
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
    """
    'productRanges': {
        'remove': ['name']
    },
    """
    'storeCoupons': {
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

