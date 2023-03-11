//
//  PackDiscount.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation

struct PackDiscount: DiscountStrategy {
    let product: ProductType
    let packQuantity: Int
    let paidQuantity: Int

    var description: String {
        "Promotion \(packQuantity)x\(paidQuantity)"
    }

    func canApply(orderItem: OrderItem) -> Bool {
        let productHasDiscount = orderItem.product.type == product
        let hasMinQuantity = orderItem.quantity / packQuantity >= 1

        return productHasDiscount && hasMinQuantity
    }

    func discountAmount(orderItem: OrderItem) -> Double {
        if !canApply(orderItem: orderItem) {
            return 0.0
        }

        let numberOfPacks = orderItem.quantity / packQuantity
        let packsCost = Double(numberOfPacks * paidQuantity) * orderItem.product.price

        return packsCost
    }
}
