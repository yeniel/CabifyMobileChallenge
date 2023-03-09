//
//  PackDiscountDto.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation

struct PackDiscountDto: Codable, Equatable {
    let product: String
    let packQuantity: Int
    let freeQuantity: Int

    enum CodingKeys: String, CodingKey {
        case product = "code"
        case packQuantity = "total"
        case freeQuantity = "free"
    }

    static func == (lhs: PackDiscountDto, rhs: PackDiscountDto) -> Bool {
        lhs.product == rhs.product
            && lhs.packQuantity == rhs.packQuantity
            && lhs.freeQuantity == rhs.freeQuantity
    }
}
