//
//  OrderRepository.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 10/3/23.
//

import Foundation
import Combine

protocol OrderRepository {
    func saveOrder(order: Order)
    func loadOrder() -> AnyPublisher<Order, CabifyError>
}
