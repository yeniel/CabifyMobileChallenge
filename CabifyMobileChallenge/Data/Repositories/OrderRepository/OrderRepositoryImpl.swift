//
//  OrderRepositoryImpl.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 10/3/23.
//

import Foundation
import Combine
import Factory

struct OrderRepositoryImpl: OrderRepository {
    @Injected(\.orderLocalDataSource)
    private var localDataSource: OrderDataSource

    func saveOrder(order: Order) {
        localDataSource.saveOrder(order: order)
    }

    func loadOrder() -> AnyPublisher<Order, CabifyError> {
        localDataSource.loadOrder()
    }
}
