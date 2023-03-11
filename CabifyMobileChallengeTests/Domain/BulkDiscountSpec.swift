//
//  BulkDiscountSpec.swift
//  CabifyMobileChallengeTests
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Foundation
import Quick
import Nimble
import Combine

class BulkDiscountSpec: QuickSpec {

    // swiftlint:disable function_body_length

    override func spec() {
        describe("GIVEN a 5% bulk discount for T-Shirts and an OrderItem of 1 Vouchers") {
            context("WHEN check if can apply the discount") {
                it("THEN the discount should be able to be applied") {
                    let tshirtPackDiscount = BulkDiscount(product: .tshirt, minQuantity: 3, discount: 0.05)
                    let orderItem = OrderItem(
                        product: Product(type: .voucher, name: "Cabify Voucher", price: 5.0),
                        quantity: 1
                    )

                    let result = tshirtPackDiscount.canApply(orderItem: orderItem)

                    expect(result).to(beFalse())
                }
            }
        }

        describe("GIVEN a 5% bulk discount for T-Shirts and an OrderItem of 3 Vouchers") {
            context("WHEN check if can apply the discount") {
                it("THEN the discount should be able to be applied") {
                    let tshirtPackDiscount = BulkDiscount(product: .tshirt, minQuantity: 3, discount: 0.05)
                    let orderItem = OrderItem(
                        product: Product(type: .voucher, name: "Cabify Voucher", price: 5.0),
                        quantity: 3
                    )

                    let result = tshirtPackDiscount.canApply(orderItem: orderItem)

                    expect(result).to(beFalse())
                }
            }
        }

        describe("GIVEN a 5% bulk discount for T-Shirts and an OrderItem of 1 T-Shirt") {
            context("WHEN check if can apply the discount") {
                it("THEN the discount should be able to be applied") {
                    let tshirtPackDiscount = BulkDiscount(product: .tshirt, minQuantity: 3, discount: 0.05)
                    let orderItem = OrderItem(
                        product: Product(type: .tshirt, name: "T-Shirt", price: 20.0),
                        quantity: 1
                    )

                    let result = tshirtPackDiscount.canApply(orderItem: orderItem)

                    expect(result).to(beFalse())
                }
            }
        }

        describe("GIVEN a 5% bulk discount for T-Shirts and an OrderItem of 3 T-Shirt") {
            context("WHEN check if can apply the discount") {
                it("THEN the discount should be able to be applied") {
                    let tshirtPackDiscount = BulkDiscount(product: .tshirt, minQuantity: 3, discount: 0.05)
                    let orderItem = OrderItem(
                        product: Product(type: .tshirt, name: "T-Shirt", price: 20.0),
                        quantity: 3
                    )

                    let result = tshirtPackDiscount.canApply(orderItem: orderItem)

                    expect(result).to(beTrue())
                }
            }
        }

        describe("GIVEN a 5% bulk discount for T-Shirts and an OrderItem of 4 T-Shirt") {
            context("WHEN check if can apply the discount") {
                it("THEN the discount should be able to be applied") {
                    let tshirtPackDiscount = BulkDiscount(product: .tshirt, minQuantity: 3, discount: 0.05)
                    let orderItem = OrderItem(
                        product: Product(type: .tshirt, name: "T-Shirt", price: 20.0),
                        quantity: 4
                    )

                    let result = tshirtPackDiscount.canApply(orderItem: orderItem)

                    expect(result).to(beTrue())
                }
            }
        }

        describe("GIVEN a 5% bulk discount for T-Shirts and an OrderItem of 1 T-Shirt") {
            context("WHEN get the discount amount") {
                it("THEN the discount amount should be 0€") {
                    let tshirtPackDiscount = BulkDiscount(product: .tshirt, minQuantity: 3, discount: 0.05)
                    let orderItem = OrderItem(
                        product: Product(type: .tshirt, name: "T-Shirt", price: 20.0),
                        quantity: 1
                    )

                    let result = tshirtPackDiscount.discountAmount(orderItem: orderItem)

                    expect(result).to(equal(0.0))
                }
            }
        }

        describe("GIVEN a 5% bulk discount for T-Shirts and an OrderItem of 3 T-Shirt") {
            context("WHEN get the discount amount") {
                it("THEN the discount amount should be 3€") {
                    let tshirtPackDiscount = BulkDiscount(product: .tshirt, minQuantity: 3, discount: 0.05)
                    let orderItem = OrderItem(
                        product: Product(type: .tshirt, name: "T-Shirt", price: 20.0),
                        quantity: 3
                    )

                    let result = tshirtPackDiscount.discountAmount(orderItem: orderItem)

                    expect(result).to(equal(3.0))
                }
            }
        }

        describe("GIVEN a 5% bulk discount for T-Shirts and an OrderItem of 4 T-Shirt") {
            context("WHEN get the discount amount") {
                it("THEN the discount amount should be 4€") {
                    let tshirtPackDiscount = BulkDiscount(product: .tshirt, minQuantity: 3, discount: 0.05)
                    let orderItem = OrderItem(
                        product: Product(type: .tshirt, name: "T-Shirt", price: 20.0),
                        quantity: 4
                    )

                    let result = tshirtPackDiscount.discountAmount(orderItem: orderItem)

                    expect(result).to(equal(4.0))
                }
            }
        }

        describe("GIVEN a 5% bulk discount for T-Shirts and an OrderItem of 0 T-Shirt") {
            context("WHEN get the discount amount") {
                it("THEN the discount amount should be 0€") {
                    let tshirtPackDiscount = BulkDiscount(product: .tshirt, minQuantity: 3, discount: 0.05)
                    let orderItem = OrderItem(
                        product: Product(type: .tshirt, name: "T-Shirt", price: 20.0),
                        quantity: 0
                    )

                    let result = tshirtPackDiscount.discountAmount(orderItem: orderItem)

                    expect(result).to(equal(0.0))
                }
            }
        }

        describe("GIVEN a 5% bulk discount for T-Shirts and an OrderItem of 3 Vouchers") {
            context("WHEN get the discount amount") {
                it("THEN the discount amount should be 0€") {
                    let tshirtPackDiscount = BulkDiscount(product: .tshirt, minQuantity: 3, discount: 0.05)
                    let orderItem = OrderItem(
                        product: Product(type: .voucher, name: "Cabify Voudher", price: 5.0),
                        quantity: 3
                    )

                    let result = tshirtPackDiscount.discountAmount(orderItem: orderItem)

                    expect(result).to(equal(0.0))
                }
            }
        }
    }

    // swiftlint:enable function_body_length
}
