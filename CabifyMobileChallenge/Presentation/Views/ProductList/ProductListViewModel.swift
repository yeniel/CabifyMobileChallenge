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

    @Injected(\.getProductsUseCase)
    private var getProductsUseCase: GetProductsUseCase

    private let coordinator: MainCoordinatorProtocol
    private var cancellables = Set<AnyCancellable>()

    init(coordinator: MainCoordinatorProtocol) {
        self.coordinator = coordinator

        getProductsUseCase.execute()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { products in
                    self.products = products.map {
                        ProductUIModel(
                            id: UUID(),
                            name: $0.name,
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
        coordinator.routeToCheckout()
    }
}
