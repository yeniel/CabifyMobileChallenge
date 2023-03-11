//
//  DiscountUIModel.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 10/3/23.
//

import Foundation

struct DiscountUIModel: Identifiable, Equatable {
    let id: UUID
    let name: String
    let amount: String

    // swiftlint:disable operator_whitespace

    static func ==(lhs: DiscountUIModel, rhs: DiscountUIModel) -> Bool {
        return lhs.name == rhs.name && lhs.amount == rhs.amount
    }

    // swiftlint:enable operator_whitespace
}
