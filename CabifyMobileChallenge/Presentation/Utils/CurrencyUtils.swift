//
//  CurrencyUtils.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation

extension Double {
    var currencyFormat: String {
        let formatter = NumberFormatter()

        formatter.locale = .current
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.negativePrefix = formatter.minusSign

        guard let formatted = formatter.string(from: self as NSNumber) else {
            return String(self)
        }

        return formatted
    }
}
