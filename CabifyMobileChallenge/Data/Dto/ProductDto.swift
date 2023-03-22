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
}
