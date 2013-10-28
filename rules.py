mappingOnly = {
    'productCategoryValues': {
        'name': 'storeCategoryValues',
        'columns': {
            'productCategoryValueID': 'storeCategoryValueID',
            'productCategoryID': 'storeCategoryID',
        },
    },
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
    'orderItems': {
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
    'customer_blacklists',
    'customers',
    'customFieldBindings',
    'customFields',
    'handsetProviderDevices',
    'handsetProviders',
    'orderAddresses',
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

