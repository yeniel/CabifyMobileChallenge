//
//  OrderItemUIModel.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Foundation

struct OrderItemUIModel: Identifiable, Equatable {
    let id: ProductType
    let productName: String
    let quantity: Int
    let formattedPrice: String
    let discounts: [DiscountUIModel]
}
