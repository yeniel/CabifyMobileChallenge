//
//  Mocks.swift
//  CabifyMobileChallengeTests
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Foundation
import Combine

// swiftlint:disable force_cast

struct MockApiClient<S>: ApiClient {
    var data: S

    init(data: S) {
        self.data = data
    }

    func get<T>(path: String) -> AnyPublisher<T, CabifyError> where T: Decodable {
        Just(data as! T).setFailureType(to: CabifyError.self).eraseToAnyPublisher()
    }
}

class MockOrderLocalDataSource: OrderDataSource {
    var orderSaved = false
    var order: Order?

    func loadOrder() -> AnyPublisher<Order, CabifyError> {
        Just(ObjectMother.order).setFailureType(to: CabifyError.self).eraseToAnyPublisher()
    }

    func saveOrder(order: Order) {
        orderSaved = true
        self.order = order
    }
}

struct MockLoadProductsUseCase: LoadProductsUseCase {
    func execute() -> AnyPublisher<[Product], CabifyError> {
        Just(ObjectMother.sortedProductList).setFailureType(to: CabifyError.self).eraseToAnyPublisher()
    }
}

class MockSaveOrderUseCase: SaveOrderUseCase {
    var orderSaved = false
    var order: Order?

    func execute(order: Order) {
        orderSaved = true
        self.order = order
    }
}

struct MockLoadOrderUseCase: LoadOrderUseCase {
    func execute() -> AnyPublisher<Order, CabifyError> {
        Just(ObjectMother.orderWithSortedItems).setFailureType(to: CabifyError.self).eraseToAnyPublisher()
    }
}

struct MockProductsRepository: ProductsRepository {
    func loadProducts() -> AnyPublisher<[Product], CabifyError> {
        Just(ObjectMother.productList).setFailureType(to: CabifyError.self).eraseToAnyPublisher()
    }
}

struct MockOrderRepository: OrderRepository {
    func saveOrder(order: Order) {
    }

    func loadOrder() -> AnyPublisher<Order, CabifyError> {
        Just(ObjectMother.order).setFailureType(to: CabifyError.self).eraseToAnyPublisher()
    }
}

final class MockMainCoordinator: MainCoordinatorProtocol {
    var routedToCheckout = false

    func routeToCheckout() {
        routedToCheckout = true
    }
}

// swiftlint:enable force_cast
