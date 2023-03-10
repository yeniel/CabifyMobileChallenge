//
//  LoadProductsUseCase.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation
import Combine
import Factory

struct LoadProductsUseCase: UseCase {
    @Injected(\.productsRepository)
    private var productsRepository

    typealias ResponseType = AnyPublisher<[Product], CabifyError>

    func execute() -> AnyPublisher<[Product], CabifyError> {
        productsRepository.loadProducts()
            .map { products in
                products.sorted { $0.name < $1.name }
            }
            .eraseToAnyPublisher()
    }
}
