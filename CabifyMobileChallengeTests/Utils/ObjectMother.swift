//
//  ObjectMother.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Foundation

struct ObjectMother {
    static var productList: [Product] {
        [
            Product(type: .voucher, name: "Cabify Voucher", price: 5.0),
            Product(type: .tshirt, name: "Cabify T-Shirt", price: 20.0),
            Product(type: .mug, name: "Cabify Coffee Mug", price: 7.5)
        ]
    }

    static var sortedProductList: [Product] {
        [
            Product(type: .mug, name: "Cabify Coffee Mug", price: 7.5),
            Product(type: .tshirt, name: "Cabify T-Shirt", price: 20.0),
            Product(type: .voucher, name: "Cabify Voucher", price: 5.0)
        ]
    }

    static var productListDto: ProductListDto {
        ProductListDto(products: [
            ProductDto(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
            ProductDto(code: "TSHIRT", name: "Cabify T-Shirt", price: 20.0),
            ProductDto(code: "MUG", name: "Cabify Coffee Mug", price: 7.5)
        ])
    }

    static var order: Order {
        Order(items: [
            OrderItem(
                product: productList[0],
                quantity: 3
            ),
            OrderItem(
                product: productList[1],
                quantity: 3
            ),
            OrderItem(
                product: productList[2],
                quantity: 3
            )
        ])
    }

    static var orderWithSortedItems: Order {
        Order(items: [
            OrderItem(
                product: productList[2],
                quantity: 3
            ),
            OrderItem(
                product: productList[1],
                quantity: 3
            ),
            OrderItem(
                product: productList[0],
                quantity: 3
            )
        ])
    }

    static func productUIModelList(quantity: Int = 0) -> [ProductUIModel] {
        [
            ProductUIModel(
                id: .mug,
                name: "Cabify Coffee Mug",
                price: 7.5,
                formattedPrice: "7,50 €",
                quantity: quantity
            ),
            ProductUIModel(
                id: .tshirt,
                name: "Cabify T-Shirt",
                price: 20.0,
                formattedPrice: "20,00 €",
                quantity: quantity
            ),
            ProductUIModel(
                id: .voucher,
                name: "Cabify Voucher",
                price: 5.0,
                formattedPrice: "5,00 €",
                quantity: quantity
            )
        ]
    }

    static var orderItemsUIModelList: [OrderItemUIModel] {
        [
            OrderItemUIModel(
                id: .mug,
                productName: "Cabify Coffee Mug",
                quantity: 3,
                formattedPrice: "22,50 €",
                discounts: []
            ),
            OrderItemUIModel(
                id: .tshirt,
                productName: "Cabify T-Shirt",
                quantity: 3,
                formattedPrice: "60,00 €",
                discounts: [DiscountUIModel(id: UUID(), name: "5% Discount", amount: "3,00 €")]
            ),
            OrderItemUIModel(
                id: .voucher,
                productName: "Cabify Voucher",
                quantity: 3,
                formattedPrice: "15,00 €",
                discounts: [DiscountUIModel(id: UUID(), name: "Promotion 2x1", amount: "5,00 €")]
            )

        ]
    }
}
