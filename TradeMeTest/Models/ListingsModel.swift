//
//  ListingsModel.swift
//  TradeMeTest
//
//  Created by Yuan on 20/01/22.
//

import Foundation

struct ListingsModel: Codable {
    let totalCount: Int?
    let page: Int?
    let pageSize: Int?
    let list: [ListModel]?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "TotalCount"
        case page = "Page"
        case pageSize = "PageSize"
        case list = "List"
    }
}
