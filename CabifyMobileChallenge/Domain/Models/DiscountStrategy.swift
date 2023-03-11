//
//  Discount.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 10/3/23.
//

import Foundation

protocol DiscountStrategy {
    var description: String { get }

    func canApply(orderItem: OrderItem) -> Bool
    func discountAmount(orderItem: OrderItem) -> Double
}
