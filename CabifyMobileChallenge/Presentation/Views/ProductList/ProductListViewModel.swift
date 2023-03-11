//
//  ProductListViewModel.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Combine
import Factory
import Foundation
import Stinsen

class ProductListViewModel: ObservableObject {
    @Published
    var status: ScreenStatus = .loading

    @Published
    var products: [ProductUIModel] = []

    @Published
    var showError: Bool = false

    @Injected(\.loadProductsUseCase)
    private var loadProductsUseCase: LoadProductsUseCase

    @Injected(\.saveOrderUseCase)
    private var saveOrderUseCase: SaveOrderUseCase

    private let coordinator: MainCoordinatorProtocol
    private var cancellables = Set<AnyCancellable>()

    init(coordinator: MainCoordinatorProtocol) {
        self.coordinator = coordinator

        loadProductsUseCase.execute()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { products in
                    self.products = products.map {
                        ProductUIModel(
                            id: $0.type,
                            name: $0.name,
                            price: $0.price,
                            formattedPrice: $0.price.currencyFormat,
                            quantity: 0
                        )
                    }
                    self.status = .loaded
                }
            )
            .store(in: &cancellables)
    }

    func checkout() {
        saveOrder()
        routeToCheckout()
    }

    private func saveOrder() {
        let orderItems = products.filter { $0.quantity > 0 }
            .map {
                OrderItem(
                    product: Product(type: $0.id, name: $0.name, price: $0.price),
                    quantity: $0.quantity
                )
            }

        let order = Order(items: orderItems)

        saveOrderUseCase.execute(order: order)
    }

    private func routeToCheckout() {
        coordinator.routeToCheckout()
    }
}
