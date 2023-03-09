//
//  ProductListDto.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation

struct ProductListDto: Codable, Equatable {
    let products: [ProductDto]

    static func == (lhs: ProductListDto, rhs: ProductListDto) -> Bool {
        lhs.products == rhs.products
    }
}
