//
//  GetDiscountsOfOrderItemUseCaseSpec.swift
//  CabifyMobileChallengeTests
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Foundation
import Quick
import Nimble
import Combine

// swiftlint:disable function_body_length

class GetDiscountsOfOrderItemUseCaseSpec: QuickSpec {

    override func spec() {
        describe("GIVEN an OrderItem of 1 Vouchers") {
            context("WHEN get all discounts") {
                it("THEN there is no discounts") {
                    let useCase = GetDiscountsOfOrderItemUseCase()
                    let orderItem = OrderItem(
                        product: Product(type: .voucher, name: "Cabify Voucher", price: 5.0),
                        quantity: 1
                    )

                    let discounts = useCase.execute(orderItem: orderItem)

                    expect(discounts).to(beEmpty())
                }
            }
        }

        describe("GIVEN an OrderItem of 2 Vouchers") {
            context("WHEN get all discounts") {
                it("THEN there is one 2x1 discount") {
                    let useCase = GetDiscountsOfOrderItemUseCase()
                    let orderItem = OrderItem(
                        product: Product(type: .voucher, name: "Cabify Voucher", price: 5.0),
                        quantity: 2
                    )

                    let discounts = useCase.execute(orderItem: orderItem)

                    expect(discounts).toNot(beEmpty())
                    expect(discounts.first?.description).to(equal("Promotion 2x1"))
                    expect(discounts.first?.amount).to(equal(5.0))
                }
            }
        }

        describe("GIVEN an OrderItem of 1 T-Shirt") {
            context("WHEN get all discounts") {
                it("THEN there is no discounts") {
                    let useCase = GetDiscountsOfOrderItemUseCase()
                    let orderItem = OrderItem(
                        product: Product(type: .tshirt, name: "T-Shirt", price: 20.0),
                        quantity: 1
                    )

                    let discounts = useCase.execute(orderItem: orderItem)

                    expect(discounts).to(beEmpty())
                }
            }
        }

        describe("GIVEN an OrderItem of 3 T-Shirt") {
            context("WHEN get all discounts") {
                it("THEN there is 1 discount") {
                    let useCase = GetDiscountsOfOrderItemUseCase()
                    let orderItem = OrderItem(
                        product: Product(type: .tshirt, name: "T-Shirt", price: 20.0),
                        quantity: 3
                    )

                    let discounts = useCase.execute(orderItem: orderItem)

                    expect(discounts).toNot(beEmpty())
                    expect(discounts.first?.description).to(equal("5% Discount"))
                    expect(discounts.first?.amount).to(equal(3.0))
                }
            }
        }
    }
}

// swiftlint:enable function_body_length
