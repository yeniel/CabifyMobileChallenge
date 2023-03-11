//
//  LoadOrderUseCase.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Foundation
import Combine
import Factory

struct LoadOrderUseCase {
    @Injected(\.orderRepository)
    private var orderRepository

    func execute() -> AnyPublisher<Order, CabifyError> {
        orderRepository.loadOrder()
    }
}
