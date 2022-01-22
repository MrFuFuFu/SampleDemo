//
//  ListModel.swift
//  TradeMeTest
//
//  Created by Yuan on 20/01/22.
//

import Foundation

struct ListModel: Codable {
    let __type: String?
    let listingId: Int64?
    let title: String?
    let category: String?
    let startPrice: Double?
    let buyNowPrice: Double?
    let startDate: String?
    let endDate: String?
    let asAt: String?
    let categoryPath: String?
    let pictureHref: String?
    let isNew: Bool?
    let region: String?
    let suburb: String?
    let hasBuyNow: Bool?
    let noteDate: String?
    let subtitle: String?
    let priceDisplay: String?
    let promotionId: Int?
    let memberId: Int?
    let isDealer: Bool?
    let hasSearchCardBranding: Bool?
    let searchCardTier: Int?
    let isClassified: Bool?
    let isBuyNowOnly: Bool?
    
    enum CodingKeys: String, CodingKey {
        case __type = "__type"
        case listingId = "ListingId"
        case title = "Title"
        case category = "Category"
        case startPrice = "StartPrice"
        case buyNowPrice = "BuyNowPrice"
        case startDate = "StartDate"
        case endDate = "EndDate"
        case asAt = "AsAt"
        case categoryPath = "CategoryPath"
        case pictureHref = "PictureHref"
        case isNew = "IsNew"
        case region = "Region"
        case suburb = "Suburb"
        case hasBuyNow = "HasBuyNow"
        case noteDate = "NoteDate"
        case subtitle = "Subtitle"
        case priceDisplay = "PriceDisplay"
        case promotionId = "PromotionId"
        case memberId = "MemberId"
        case isDealer = "IsDealer"
        case hasSearchCardBranding = "HasSearchCardBranding"
        case searchCardTier = "SearchCardTier"
        case isClassified = "IsClassified"
        case isBuyNowOnly = "IsBuyNowOnly"
    }
    
}
