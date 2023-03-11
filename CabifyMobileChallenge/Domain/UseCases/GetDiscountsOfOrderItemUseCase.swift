//
//  GetDiscountsOfOrderItem.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Foundation

struct GetDiscountsOfOrderItemUseCase {
    let discountStrategies: [DiscountStrategy] = [
        PackDiscount(product: .voucher, packQuantity: 2, paidQuantity: 1),
        BulkDiscount(product: .tshirt, minQuantity: 3, discount: 0.05)
    ]

    func execute(orderItem: OrderItem) -> [OrderItemDiscount] {
        var discounts: [OrderItemDiscount] = []

        for discount in self.discountStrategies where discount.canApply(orderItem: orderItem) {
            discounts.append(
                OrderItemDiscount(
                    description: discount.description,
                    amount: discount.discountAmount(orderItem: orderItem)
                )
            )
        }

        return discounts
    }
}
