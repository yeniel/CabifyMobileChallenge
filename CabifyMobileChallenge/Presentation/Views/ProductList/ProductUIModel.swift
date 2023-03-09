//
//  ProductUIModel.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation

struct ProductUIModel: Identifiable, Equatable {
    let id: UUID
    let name: String
    let formattedPrice: String
    var quantity: Int
}
