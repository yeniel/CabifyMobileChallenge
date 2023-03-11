//
//  OrderLocalDataSource.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 10/3/23.
//

import Foundation
import Combine
import Factory

struct OrderLocalDataSource: OrderDataSource {
    @Injected(\.localMapper)
    private var localMapper: LocalMapper

    private var defaults = UserDefaults.standard
    private var orderKey = "OrderKey"

    func saveOrder(order: Order) {
        let orderDict = localMapper.orderToUserDefaultsOrder(order: order)

        defaults.set(orderDict, forKey: orderKey)
    }

    func loadOrder() -> AnyPublisher<Order, CabifyError> {
        guard let orderDict = defaults.object(forKey: orderKey) as? [String: Any] else {
            return Fail(error: CabifyError.unknown).eraseToAnyPublisher()
        }

        guard let order = localMapper.userDefaultOrderToOrder(order: orderDict) else {
            return Fail(error: CabifyError.unknown).eraseToAnyPublisher()
        }

        return Just(order).setFailureType(to: CabifyError.self).eraseToAnyPublisher()
    }
}
