//
//  PackDiscountSpec.swift
//  CabifyMobileChallengeTests
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Foundation
import Quick
import Nimble
import Combine

class PackDiscountSpec: QuickSpec {

    // swiftlint:disable function_body_length

    override func spec() {
        describe("GIVEN a 2x1 discount for vouchers and an OrderItem of 1 Vouchers") {
            context("WHEN check if can apply the discount") {
                it("THEN the discount should NOT be able to be applied") {
                    let voucherPackDiscount = PackDiscount(product: .voucher, packQuantity: 2, paidQuantity: 1)
                    let orderItem = OrderItem(
                        product: Product(type: .voucher, name: "Cabify Voucher", price: 5.0),
                        quantity: 1
                    )

                    let result = voucherPackDiscount.canApply(orderItem: orderItem)

                    expect(result).to(beFalse())
                }
            }
        }

        describe("GIVEN a 2x1 discount for vouchers and an OrderItem of 2 Vouchers") {
            context("WHEN check if can apply the discount") {
                it("THEN the discount should be able to be applied") {
                    let voucherPackDiscount = PackDiscount(product: .voucher, packQuantity: 2, paidQuantity: 1)
                    let orderItem = OrderItem(
                        product: Product(type: .voucher, name: "Cabify Voucher", price: 5.0),
                        quantity: 2
                    )

                    let result = voucherPackDiscount.canApply(orderItem: orderItem)

                    expect(result).to(beTrue())
                }
            }
        }

        describe("GIVEN a 2x1 discount for vouchers and an OrderItem of 3 Vouchers") {
            context("WHEN check if can apply the discount") {
                it("THEN the discount should be able to be applied") {
                    let voucherPackDiscount = PackDiscount(product: .voucher, packQuantity: 2, paidQuantity: 1)
                    let orderItem = OrderItem(
                        product: Product(type: .voucher, name: "Cabify Voucher", price: 5.0),
                        quantity: 3
                    )

                    let result = voucherPackDiscount.canApply(orderItem: orderItem)

                    expect(result).to(beTrue())
                }
            }
        }

        describe("GIVEN a 2x1 discount for vouchers and an OrderItem of 4 Vouchers") {
            context("WHEN check if can apply the discount") {
                it("THEN the discount should be able to be applied") {
                    let voucherPackDiscount = PackDiscount(product: .voucher, packQuantity: 2, paidQuantity: 1)
                    let orderItem = OrderItem(
                        product: Product(type: .voucher, name: "Cabify Voucher", price: 5.0),
                        quantity: 4
                    )

                    let result = voucherPackDiscount.canApply(orderItem: orderItem)

                    expect(result).to(beTrue())
                }
            }
        }

        describe("GIVEN a 2x1 discount for vouchers and an OrderItem of 2 T-Shirts") {
            context("WHEN check if can apply the discount") {
                it("THEN the discount should NOT be able to be applied") {
                    let voucherPackDiscount = PackDiscount(product: .voucher, packQuantity: 2, paidQuantity: 1)
                    let orderItem = OrderItem(
                        product: Product(type: .tshirt, name: "T-Shirt", price: 20.0),
                        quantity: 2
                    )

                    let result = voucherPackDiscount.canApply(orderItem: orderItem)

                    expect(result).to(beFalse())
                }
            }
        }

        describe("GIVEN a 2x1 discount for vouchers and an OrderItem of 1 T-Shirts") {
            context("WHEN check if can apply the discount") {
                it("THEN the discount should NOT be able to be applied") {
                    let voucherPackDiscount = PackDiscount(product: .voucher, packQuantity: 2, paidQuantity: 1)
                    let orderItem = OrderItem(
                        product: Product(type: .tshirt, name: "T-Shirt", price: 20.0),
                        quantity: 1
                    )

                    let result = voucherPackDiscount.canApply(orderItem: orderItem)

                    expect(result).to(beFalse())
                }
            }
        }

        describe("GIVEN a 2x1 discount for vouchers and an OrderItem of 4 Vouchers of 5€") {
            context("WHEN get the discount amount") {
                it("THEN the discount amount should be 10€") {
                    let voucherPackDiscount = PackDiscount(product: .voucher, packQuantity: 2, paidQuantity: 1)
                    let orderItem = OrderItem(
                        product: Product(type: .voucher, name: "Cabify Voucher", price: 5.0),
                        quantity: 4
                    )

                    let result = voucherPackDiscount.discountAmount(orderItem: orderItem)

                    expect(result).to(equal(10.0))
                }
            }
        }

        describe("GIVEN a 2x1 discount for vouchers and an OrderItem of 3 Vouchers of 5€") {
            context("WHEN get the discount amount") {
                it("THEN the discount amount should be 5€") {
                    let voucherPackDiscount = PackDiscount(product: .voucher, packQuantity: 2, paidQuantity: 1)
                    let orderItem = OrderItem(
                        product: Product(type: .voucher, name: "Cabify Voucher", price: 5.0),
                        quantity: 3
                    )

                    let result = voucherPackDiscount.discountAmount(orderItem: orderItem)

                    expect(result).to(equal(5.0))
                }
            }
        }

        describe("GIVEN a 2x1 discount for vouchers and an OrderItem of 2 Vouchers of 5€") {
            context("WHEN get the discount amount") {
                it("THEN the discount amount should be 5€") {
                    let voucherPackDiscount = PackDiscount(product: .voucher, packQuantity: 2, paidQuantity: 1)
                    let orderItem = OrderItem(
                        product: Product(type: .voucher, name: "Cabify Voucher", price: 5.0),
                        quantity: 2
                    )

                    let result = voucherPackDiscount.discountAmount(orderItem: orderItem)

                    expect(result).to(equal(5.0))
                }
            }
        }

        describe("GIVEN a 2x1 discount for vouchers and an OrderItem of 1 Vouchers of 5€") {
            context("WHEN get the discount amount") {
                it("THEN the discount amount should be 0€") {
                    let voucherPackDiscount = PackDiscount(product: .voucher, packQuantity: 2, paidQuantity: 1)
                    let orderItem = OrderItem(
                        product: Product(type: .voucher, name: "Cabify Voucher", price: 5.0),
                        quantity: 1
                    )

                    let result = voucherPackDiscount.discountAmount(orderItem: orderItem)

                    expect(result).to(equal(0.0))
                }
            }
        }

        describe("GIVEN a 2x1 discount for vouchers and an OrderItem of 0 Vouchers of 5€") {
            context("WHEN get the discount amount") {
                it("THEN the discount amount should be 0€") {
                    let voucherPackDiscount = PackDiscount(product: .voucher, packQuantity: 2, paidQuantity: 1)
                    let orderItem = OrderItem(
                        product: Product(type: .voucher, name: "Cabify Voucher", price: 5.0),
                        quantity: 0
                    )

                    let result = voucherPackDiscount.discountAmount(orderItem: orderItem)

                    expect(result).to(equal(0.0))
                }
            }
        }

        describe("GIVEN a 2x1 discount for vouchers and an OrderItem of 2 T-Shirt of 5€") {
            context("WHEN get the discount amount") {
                it("THEN the discount amount should be 0€") {
                    let voucherPackDiscount = PackDiscount(product: .voucher, packQuantity: 2, paidQuantity: 1)
                    let orderItem = OrderItem(
                        product: Product(type: .tshirt, name: "T-Shirt", price: 20.0),
                        quantity: 2
                    )

                    let result = voucherPackDiscount.discountAmount(orderItem: orderItem)

                    expect(result).to(equal(0.0))
                }
            }
        }
    }

    // swiftlint:enable function_body_length
}
