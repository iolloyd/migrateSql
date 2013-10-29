mappingOnly = {
    'productCategoryValues': {
        'name': 'storeCategoryValues',
        'columns': {
            'productCategoryValueID': 'storeCategoryValueID',
            'productCategoryID': 'storeCategoryID',
        },
    },
    'orders': {
        'name': 'tmpOrders'
    },
    'orderQuotes': {
        'name': 'orderInvoices'
    },
    'billerActiveCurrencies': {
        'columns': {
            'default': 'is_default'
        }
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
    'customerBlacklists': {
        'name': 'customer_blacklists',
        'remove': ['timedate'],
        'columns': {
            'customerBlacklistID': 'customer_blacklist_id',
            'customerID': 'customer_id',
            'storeID': 'store_id',
        }
    },
    'languages': {
        'columns': {
            'languageID': 'id'
            },
        },
    'orderAddresses': {
        'name': 'order_addresses',
        'columns': {
            'orderAddressID': 'order_address_id',
            'orderID': 'order_id',
            'customerAddressID': 'customer_address_id',
            },
    },
    'orderQuotes': {
        'name': 'orderInvoices'
    },
    'storeCoupons': {
        'remove': ['requiredProducts'],
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

newTables = [
    'tmpOrders',
    'storeCoupons',
]

insertOnly = [
    'billerCards',
    'billerCosts',
    'billerCurrencies',
    'billerCurrencyRates',
    'billers',
    'billerStoredDetails',
    #'billerTransactionRequests',
    'billerTransactions',
    'coupons',
    'customerAddresses',
    'customerAuthentication',
    'customer_blacklists',
    'customers',
    'customFields',
    'handsetProviderDevices',
    'handsetProviders',
    'languages',
    'tmpOrders',
    'orderItems',
    'productCategories',
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
    'storeCategoryValues',
    'storeCoupons',
    'storeImageGroups',
    'storeImages',
    'storeProducts',
    'storeRegionCurrencies',
    'storeRegions',
    'stores',
    'tagDomains',
    'tagLocations',
    'tagRedirectRules',
    'tagRedirects',
    'tags',
    'tagScans',
    'transactionLogs',
]

