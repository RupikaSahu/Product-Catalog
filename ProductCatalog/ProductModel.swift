//
//  ProductModel.swift
//  ProductCatalog
//
//  Created by Rupika Sahu on 28/09/20.
//  Copyright © 2020 Rupika Sahu. All rights reserved.
//

import Foundation

struct ProductsResult : Codable {
    var code : Int?
    var status : String?
    var data : ProductList?

    enum CodingKeys: String, CodingKey {
        case code
        case status
        case data
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        data = try values.decodeIfPresent(ProductList.self, forKey: .data)
    }
}

struct ProductList : Codable {
    var pageType : [String]?
    var searchTerm : String?
    var suggestions : [String]?
    var correctedSearchResponses : [String]?
    var ageRestricted : Bool?
    var products : [Product]?
    var sorting : Sorting?
    var filters : [Filters]?
    var quickFilters : [QuickFilters]?
    var paging : Paging?
    var maxOffers : Int?
    var serverCurrentTime : Int?
    var productInfo : ProductInfo?
    var code : String?
    var selectedCategoryIds : [String]?
    var visibleCategoryIds : [String]?
    var exclusiveCampProducts : [String]?
    var exclusiveCampRow : Int?
    var responseFlags : [String]?
    var showRestrictedMsg : Bool?
    var redirectionUrl : String?
    var trackerFields : [String]?
    var intentAttributes : [String]?
    var personalizedAttributes : [String]?
    var nerAttributes : [String]?
    var intentApplied : Bool?
    var nerApplied : Bool?
    var showAllCategories : Bool?
    var searchPageUrl : String?
    var catIntentFailed : Bool?
    var sellerAdsPosition : [Int]?
    var nearbyLocationFailed : Bool?
    var correctedNearbyLocation : String?
    var interspersedCardFilters : [String]?

    enum CodingKeys: String, CodingKey {
        case pageType
        case searchTerm
        case suggestions
        case correctedSearchResponses
        case ageRestricted
        case products
        case sorting
        case filters
        case quickFilters
        case paging
        case maxOffers
        case serverCurrentTime
        case productInfo
        case code
        case selectedCategoryIds
        case visibleCategoryIds
        case exclusiveCampProducts
        case exclusiveCampRow
        case responseFlags
        case showRestrictedMsg
        case redirectionUrl
        case trackerFields
        case intentAttributes
        case personalizedAttributes
        case nerAttributes
        case intentApplied
        case nerApplied
        case showAllCategories
        case searchPageUrl
        case catIntentFailed
        case sellerAdsPosition
        case nearbyLocationFailed
        case correctedNearbyLocation
        case interspersedCardFilters
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pageType = try values.decodeIfPresent([String].self, forKey: .pageType)
        searchTerm = try values.decodeIfPresent(String.self, forKey: .searchTerm)
        suggestions = try values.decodeIfPresent([String].self, forKey: .suggestions)
        correctedSearchResponses = try values.decodeIfPresent([String].self, forKey: .correctedSearchResponses)
        ageRestricted = try values.decodeIfPresent(Bool.self, forKey: .ageRestricted)
        products = try values.decodeIfPresent([Product].self, forKey: .products)
        sorting = try values.decodeIfPresent(Sorting.self, forKey: .sorting)
        filters = try values.decodeIfPresent([Filters].self, forKey: .filters)
        quickFilters = try values.decodeIfPresent([QuickFilters].self, forKey: .quickFilters)
        paging = try values.decodeIfPresent(Paging.self, forKey: .paging)
        maxOffers = try values.decodeIfPresent(Int.self, forKey: .maxOffers)
        serverCurrentTime = try values.decodeIfPresent(Int.self, forKey: .serverCurrentTime)
        productInfo = try values.decodeIfPresent(ProductInfo.self, forKey: .productInfo)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        selectedCategoryIds = try values.decodeIfPresent([String].self, forKey: .selectedCategoryIds)
        visibleCategoryIds = try values.decodeIfPresent([String].self, forKey: .visibleCategoryIds)
        exclusiveCampProducts = try values.decodeIfPresent([String].self, forKey: .exclusiveCampProducts)
        exclusiveCampRow = try values.decodeIfPresent(Int.self, forKey: .exclusiveCampRow)
        responseFlags = try values.decodeIfPresent([String].self, forKey: .responseFlags)
        showRestrictedMsg = try values.decodeIfPresent(Bool.self, forKey: .showRestrictedMsg)
        redirectionUrl = try values.decodeIfPresent(String.self, forKey: .redirectionUrl)
        trackerFields = try values.decodeIfPresent([String].self, forKey: .trackerFields)
        intentAttributes = try values.decodeIfPresent([String].self, forKey: .intentAttributes)
        personalizedAttributes = try values.decodeIfPresent([String].self, forKey: .personalizedAttributes)
        nerAttributes = try values.decodeIfPresent([String].self, forKey: .nerAttributes)
        intentApplied = try values.decodeIfPresent(Bool.self, forKey: .intentApplied)
        nerApplied = try values.decodeIfPresent(Bool.self, forKey: .nerApplied)
        showAllCategories = try values.decodeIfPresent(Bool.self, forKey: .showAllCategories)
        searchPageUrl = try values.decodeIfPresent(String.self, forKey: .searchPageUrl)
        catIntentFailed = try values.decodeIfPresent(Bool.self, forKey: .catIntentFailed)
        sellerAdsPosition = try values.decodeIfPresent([Int].self, forKey: .sellerAdsPosition)
        nearbyLocationFailed = try values.decodeIfPresent(Bool.self, forKey: .nearbyLocationFailed)
        correctedNearbyLocation = try values.decodeIfPresent(String.self, forKey: .correctedNearbyLocation)
        interspersedCardFilters = try values.decodeIfPresent([String].self, forKey: .interspersedCardFilters)
    }

}

struct  ProductInfo: Codable {
    var productInfo: [[String: productData]]?
    
    enum CodingKeys: String, CodingKey {
        case productInfo
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productInfo = try values.decodeIfPresent([[String: productData]].self, forKey: .productInfo)
    }
}

struct productData: Codable {
    var campaignCode: [String]?
    var campaignName: [String]?
    var tags: [String]?
    
    enum CodingKeys: String, CodingKey {
        case campaignCode = "campaign_code"
        case campaignName = "campaign_name"
        case tags = "tags"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        campaignCode = try values.decodeIfPresent([String].self, forKey: .campaignCode)
        campaignName = try values.decodeIfPresent([String].self, forKey: .campaignName)
        tags = try values.decodeIfPresent([String].self, forKey: .tags)
    }
}

struct Badge : Codable {
    var merchantBadge : String?

    enum CodingKeys: String, CodingKey {
        case merchantBadge
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        merchantBadge = try values.decodeIfPresent(String.self, forKey: .merchantBadge)
    }
    
}

struct Attributes : Codable {
    var count : Int?
    var optionListingType: String?
    var values: [String]?

    enum CodingKeys: String, CodingKey {
        case count
        case optionListingType
        case values
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        count = try value.decodeIfPresent(Int.self, forKey: .count)
        optionListingType = try value.decodeIfPresent(String.self, forKey: .optionListingType)
        values = try value.decodeIfPresent([String].self, forKey: .values)
    }
    
}

struct Filters : Codable {
    var name : String?
    var type : String?
    var searchable : Bool?
    var parameter : String?
    var theme : String?
    var data : [Data]?
    var horizontal : Bool?

    enum CodingKeys: String, CodingKey {
        case name
        case type
        case searchable
        case parameter
        case theme
        case data
        case horizontal
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        searchable = try values.decodeIfPresent(Bool.self, forKey: .searchable)
        parameter = try values.decodeIfPresent(String.self, forKey: .parameter)
        theme = try values.decodeIfPresent(String.self, forKey: .theme)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        horizontal = try values.decodeIfPresent(Bool.self, forKey: .horizontal)
    }
    
}

struct Options : Codable {
    var label : String?
    var name : String?
    var value : Int?
    var selected : Bool?

    enum CodingKeys: String, CodingKey {
        case label
        case name
        case value
        case selected
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        label = try values.decodeIfPresent(String.self, forKey: .label)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        value = try values.decodeIfPresent(Int.self, forKey: .value)
        selected = try values.decodeIfPresent(Bool.self, forKey: .selected)
    }
    
}

struct Paging : Codable {
    var page : Int?
    var total_page : Int?
    var item_per_page : Int?
    var total_item : Int?

    enum CodingKeys: String, CodingKey {
        case page
        case total_page
        case item_per_page
        case total_item
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        total_page = try values.decodeIfPresent(Int.self, forKey: .total_page)
        item_per_page = try values.decodeIfPresent(Int.self, forKey: .item_per_page)
        total_item = try values.decodeIfPresent(Int.self, forKey: .total_item)
    }
    
}

struct Price : Codable {
    var priceDisplay : String?
    var strikeThroughPriceDisplay : String?
    var discount : Int?
    var minPrice : Double?
    var offerPriceDisplay : String?

    enum CodingKeys: String, CodingKey {
        case priceDisplay
        case strikeThroughPriceDisplay
        case discount
        case minPrice
        case offerPriceDisplay
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        priceDisplay = try values.decodeIfPresent(String.self, forKey: .priceDisplay)
        strikeThroughPriceDisplay = try values.decodeIfPresent(String.self, forKey: .strikeThroughPriceDisplay)
        discount = try values.decodeIfPresent(Int.self, forKey: .discount)
        minPrice = try values.decodeIfPresent(Double.self, forKey: .minPrice)
        offerPriceDisplay = try values.decodeIfPresent(String.self, forKey: .offerPriceDisplay)
    }

}

struct QuickFilters : Codable {
    var name : String?
    var label : String?
    var type : String?
    var searchable : Bool?
    var parameter : String?
    var theme : String?
    var data : [Data]?
    var horizontal : Bool?

    enum CodingKeys: String, CodingKey {
        case name
        case label
        case type
        case searchable
        case parameter
        case theme
        case data
        case horizontal
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        label = try values.decodeIfPresent(String.self, forKey: .label)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        searchable = try values.decodeIfPresent(Bool.self, forKey: .searchable)
        parameter = try values.decodeIfPresent(String.self, forKey: .parameter)
        theme = try values.decodeIfPresent(String.self, forKey: .theme)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        horizontal = try values.decodeIfPresent(Bool.self, forKey: .horizontal)
    }

}

struct Review : Codable {
    var rating : Int?
    var count : Int?

    enum CodingKeys: String, CodingKey {
        case rating
        case count
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
    }

}

struct RootCategory : Codable {
    var id : String?
    var name : String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}

struct Product : Codable {
    var id : String?
    var sku : String?
    var merchantCode : String?
    var status : String?
    var name : String?
    var price : Price?
    var images : [String]?
    var rootCategory : RootCategory?
    var brand : String?
    var review : Review?
    var itemCount : Int?
    var defaultSku : String?
    var itemSku : String?
    var tags : [String]?
    var formattedId : String?
    var url : String?
    var attributes : [Attributes]?
    var productFeatures : String?
    var storeClosingInfo : StoreClosingInfo?
    var promoEndTime : Int?
    var debugData : [String: String]?
    var allCategories : [String]?
    var merchantVoucherCount : Int?
    var expandedProducts : [Product]?
    var location : String?
    var numLocations : Int?
    var badge : Badge?
    var official : Bool?
    var otherOfferings: OtherOffering?

    enum CodingKeys: String, CodingKey {
        case id
        case sku
        case merchantCode
        case status
        case name
        case price
        case images
        case rootCategory
        case brand
        case review
        case itemCount
        case defaultSku
        case itemSku
        case tags
        case formattedId
        case url
        case attributes
        case productFeatures
        case storeClosingInfo
        case promoEndTime
        case debugData
        case allCategories
        case merchantVoucherCount
        case expandedProducts
        case location
        case numLocations
        case badge
        case official
        case otherOfferings
    }

    init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            sku = try values.decodeIfPresent(String.self, forKey: .sku)
            merchantCode = try values.decodeIfPresent(String.self, forKey: .merchantCode)
            status = try values.decodeIfPresent(String.self, forKey: .status)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            price = try values.decodeIfPresent(Price.self, forKey: .price)
            images = try values.decodeIfPresent([String].self, forKey: .images)
            rootCategory = try values.decodeIfPresent(RootCategory.self, forKey: .rootCategory)
            brand = try values.decodeIfPresent(String.self, forKey: .brand)
            review = try values.decodeIfPresent(Review.self, forKey: .review)
            itemCount = try values.decodeIfPresent(Int.self, forKey: .itemCount)
            defaultSku = try values.decodeIfPresent(String.self, forKey: .defaultSku)
            itemSku = try values.decodeIfPresent(String.self, forKey: .itemSku)
            tags = try values.decodeIfPresent([String].self, forKey: .tags)
            formattedId = try values.decodeIfPresent(String.self, forKey: .formattedId)
            url = try values.decodeIfPresent(String.self, forKey: .url)
            attributes = try values.decodeIfPresent([Attributes].self, forKey: .attributes)
            productFeatures = try values.decodeIfPresent(String.self, forKey: .productFeatures)
            storeClosingInfo = try values.decodeIfPresent(StoreClosingInfo.self, forKey: .storeClosingInfo)
            promoEndTime = try values.decodeIfPresent(Int.self, forKey: .promoEndTime)
            debugData = try values.decodeIfPresent([String: String].self, forKey: .debugData)
            allCategories = try values.decodeIfPresent([String].self, forKey: .allCategories)
            merchantVoucherCount = try values.decodeIfPresent(Int.self, forKey: .merchantVoucherCount)
            expandedProducts = try values.decodeIfPresent([Product].self, forKey: .expandedProducts)
            location = try values.decodeIfPresent(String.self, forKey: .location)
            numLocations = try values.decodeIfPresent(Int.self, forKey: .numLocations)
            badge = try values.decodeIfPresent(Badge.self, forKey: .badge)
            official = try values.decodeIfPresent(Bool.self, forKey: .official)
            otherOfferings = try values.decodeIfPresent(OtherOffering.self, forKey: .otherOfferings)
        } catch {
            print(error.localizedDescription)
        }
    }

}

struct OtherOffering: Codable {
    var count: Int?
    var startPrice: String?
    var allOfferPageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case count
        case startPrice
        case allOfferPageUrl
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        startPrice = try values.decodeIfPresent(String.self, forKey: .startPrice)
        allOfferPageUrl = try values.decodeIfPresent(String.self, forKey: .allOfferPageUrl)
    }
}

struct Sorting : Codable {
    let parameter : String?
    let options : [Options]?

    enum CodingKeys: String, CodingKey {
        case parameter
        case options
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        parameter = try values.decodeIfPresent(String.self, forKey: .parameter)
        options = try values.decodeIfPresent([Options].self, forKey: .options)
    }

}

struct StoreClosingInfo : Codable {
    var storeClosed : Bool?
    var endDate : Int?
    var delayShipping : Bool?

    enum CodingKeys: String, CodingKey {
        case storeClosed
        case endDate
        case delayShipping
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        storeClosed = try values.decodeIfPresent(Bool.self, forKey: .storeClosed)
        endDate = try values.decodeIfPresent(Int.self, forKey: .endDate)
        delayShipping = try values.decodeIfPresent(Bool.self, forKey: .delayShipping)
    }

}
