//
//  LocalMapper.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 10/3/23.
//

import Foundation

struct LocalMapper {
    func orderToUserDefaultsOrder(order: Order) -> [String: Any] {
        [
            "items": order.items.map {
                [
                    "productType": $0.product.type.rawValue,
                    "productName": $0.product.name,
                    "productPrice": $0.product.price,
                    "quantity": $0.quantity
                ]
            }
        ]
    }

    func userDefaultOrderToOrder(order: [String: Any]) -> Order? {
        guard let userDefaultsItems = order["items"] as? [[String: Any]] else {
            return nil
        }

        var items: [OrderItem] = []

        for item in userDefaultsItems {
            guard let productTypeString = item["productType"] as? String,
                    let productType = ProductType(rawValue: productTypeString) else {
                return nil
            }

            guard let productName = item["productName"] as? String else {
                return nil
            }

            guard let productPrice = item["productPrice"] as? Double else {
                return nil
            }

            guard let quantity = item["quantity"] as? Int else {
                return nil
            }

            items.append(
                OrderItem(
                    product: Product(
                        type: productType,
                        name: productName,
                        price: productPrice
                    ),
                    quantity: quantity
                )
            )
        }

        return Order(items: items)
    }
}
