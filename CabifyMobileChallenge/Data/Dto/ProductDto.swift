//
//  ProductDto.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 8/3/23.
//

import Foundation

struct ProductDto: Codable, Equatable {
    let code: String
    let name: String
    let price: Double

    enum CodingKeys: String, CodingKey {
        case code
        case name
        case price
    }

    static func == (lhs: ProductDto, rhs: ProductDto) -> Bool {
        lhs.code == rhs.code
            && lhs.name == rhs.name
            && lhs.price == rhs.price
    }
}
