//
//  Discount.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 10/3/23.
//

import Foundation

/// To modelize the discounts I chose the *Strategy* pattern.
/// I identify two kind of discounts from the current specifications, pack and bulk discount.
protocol DiscountStrategy {
    var description: String { get }

    func canApply(orderItem: OrderItem) -> Bool
    func discountAmount(orderItem: OrderItem) -> Double
}
