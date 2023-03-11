//
//  CurrencyUtilsSpec.swift
//  CabifyMobileChallengeTests
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Foundation
import Quick
import Nimble

class CurrencyUtilsSpec: QuickSpec {
    override func spec() {
        describe("GIVEN the price number 5.0") {
            context("WHEN get the currency format") {
                it("THEN the result is 5,00 €") {
                    let price = 5.0

                    let currencyFormat = price.currencyFormat

                    expect(currencyFormat).to(equal("5,00 €"))
                }
            }
        }

        describe("GIVEN the price number 7.5") {
            context("WHEN get the currency format") {
                it("THEN the result is 7,50 €") {
                    let price = 7.5

                    let currencyFormat = price.currencyFormat

                    expect(currencyFormat).to(equal("7,50 €"))
                }
            }
        }

        describe("GIVEN the price number -1.015") {
            context("WHEN get the currency format") {
                it("THEN the result is -1,02 €") {
                    let price = -1.015

                    let currencyFormat = price.currencyFormat

                    expect(currencyFormat).to(equal("-1,02 €"))
                }
            }
        }
    }
}
