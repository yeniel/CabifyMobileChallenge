//
//  BulkDiscount.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation

struct BulkDiscountDto: Codable, Equatable {
    let product: String
    let minQuantity: Int
    let discount: Int

    enum CodingKeys: String, CodingKey {
        case product = "code"
        case minQuantity = "minimum"
        case discount
    }

    static func == (lhs: BulkDiscountDto, rhs: BulkDiscountDto) -> Bool {
        lhs.product == rhs.product
            && lhs.minQuantity == rhs.minQuantity
            && lhs.discount == rhs.discount
    }
}
