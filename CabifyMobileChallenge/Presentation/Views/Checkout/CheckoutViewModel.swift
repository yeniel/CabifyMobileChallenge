//
//  CheckoutViewModel.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation
import Combine
import Factory

class CheckoutViewModel: ObservableObject {
    @Published
    var orderItems: [OrderItemUIModel] = []

    @Published
    var totalPrice: String = ""

    @Injected(\.loadOrderUseCase)
    private var loadOrderUseCase: LoadOrderUseCase

    @Injected(\.getDiscountsOfOrderItemUseCase)
    private var getDiscountsOfOrderItemUseCase

    private var cancellables = Set<AnyCancellable>()

    init() {
        loadOrderUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { order in
                    var totalPrice = 0.0

                    self.orderItems = order.items.map {
                        let discounts = self.getDiscountsOfOrderItemUseCase.execute(orderItem: $0)
                        let discountsUIModel: [DiscountUIModel] = discounts.map {
                            self.mapToDiscountUIModel(discount: $0)
                        }
                        let orderItemPrice = Double($0.quantity) * $0.productPrice
                        let discountsAmount = discounts.map { $0.amount }.reduce(0, +)

                        totalPrice += orderItemPrice - discountsAmount

                        return OrderItemUIModel(
                            id: UUID(),
                            productName: $0.productName,
                            quantity: $0.quantity,
                            formattedPrice: orderItemPrice.currencyFormat,
                            discounts: discountsUIModel
                        )
                    }

                    self.totalPrice = totalPrice.currencyFormat
                }
            )
            .store(in: &cancellables)
    }

    private func mapToDiscountUIModel(discount: OrderItemDiscount) -> DiscountUIModel {
        DiscountUIModel(id: UUID(), name: discount.description, amount: discount.amount.currencyFormat)
    }
}
