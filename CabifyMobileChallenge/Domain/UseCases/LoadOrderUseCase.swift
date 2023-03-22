//
//  LoadOrderUseCase.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Foundation
import Combine
import Factory

protocol LoadOrderUseCase {
    func execute() -> AnyPublisher<Order, CabifyError>
}

struct LoadOrderUseCaseImpl: LoadOrderUseCase {
    @Injected(\.orderRepository)
    private var orderRepository

    func execute() -> AnyPublisher<Order, CabifyError> {
        orderRepository.loadOrder()
            .map { order in
                Order(items: order.items.sorted { $0.product.name < $1.product.name })
            }
            .eraseToAnyPublisher()
    }
}
