//
//  BulkDiscount.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation

/// The bulk discount has a minimum quantity and the discount percentage,
/// in the current specifications the min quantity is 3 and the percentage is 5%
struct BulkDiscount: DiscountStrategy {
    let product: ProductType
    let minQuantity: Int
    let discount: Double

    var description: String {
        "\(Int(discount * 100))% Discount"
    }

    func canApply(orderItem: OrderItem) -> Bool {
        let productHasDiscount = orderItem.product.type == product
        let hasMinQuantity = orderItem.quantity >= minQuantity

        return productHasDiscount && hasMinQuantity
    }

    func discountAmount(orderItem: OrderItem) -> Double {
        if !canApply(orderItem: orderItem) {
            return 0.0
        }

        return discount * orderItem.product.price * Double(orderItem.quantity)
    }
}
