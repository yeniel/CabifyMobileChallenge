//
//  ProductUIModel.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation

struct ProductUIModel: Identifiable, Equatable {
    var id: UUID
    let type: ProductType
    let name: String
    let price: Double
    let formattedPrice: String
    var quantity: Int
}
