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
                            id: UUID(),
                            type: $0.type,
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

    func routeToCheckout() {
        let orderItems = products.filter { $0.quantity > 0 }
            .map {
                OrderItem(
                    productType: $0.type,
                    productName: $0.name,
                    productPrice: $0.price,
                    quantity: $0.quantity
                )
            }

        let order = Order(items: orderItems)

        saveOrderUseCase.execute(order: order)
        coordinator.routeToCheckout()
    }
}
