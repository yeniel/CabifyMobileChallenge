//
//  SaveOrderUseCase.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 10/3/23.
//

import Foundation
import Combine
import Factory

struct SaveOrderUseCase {
    @Injected(\.orderRepository)
    private var orderRepository

    func execute(order: Order) {
        orderRepository.saveOrder(order: order)
    }
}
