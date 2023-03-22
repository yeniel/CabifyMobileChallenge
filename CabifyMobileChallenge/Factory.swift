//
//  Factory.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation
import Factory

extension Container {
    // MARK: ApiClient

    var urlSessionApiClient: Factory<ApiClient> {
        Factory(self) { UrlSessionApiClient() }
    }

    // MARK: Repositories

    var productsRepository: Factory<ProductsRepository> {
        Factory(self) { ProductsRepositoryImpl() }
    }

    var productsApiDataSource: Factory<ProductsDataSource> {
        Factory(self) { ProductsApiDataSource() }
    }

    var orderRepository: Factory<OrderRepository> {
        Factory(self) { OrderRepositoryImpl() }
    }

    var orderLocalDataSource: Factory<OrderDataSource> {
        Factory(self) { OrderLocalDataSource() }
    }

    // MARK: Mappers

    var dtoMapper: Factory<DtoMapper> {
        Factory(self) { DtoMapper() }
    }

    var localMapper: Factory<LocalMapper> {
        Factory(self) { LocalMapper() }
    }

    // MARK: Use Cases

    var loadProductsUseCase: Factory<LoadProductsUseCase> {
        Factory(self) { LoadProductsUseCaseImpl() }
    }

    var saveOrderUseCase: Factory<SaveOrderUseCase> {
        Factory(self) { SaveOrderUseCaseImpl() }
    }

    var loadOrderUseCase: Factory<LoadOrderUseCase> {
        Factory(self) { LoadOrderUseCaseImpl() }
    }

    var getDiscountsOfOrderItemUseCase: Factory<GetDiscountsOfOrderItemUseCase> {
        Factory(self) { GetDiscountsOfOrderItemUseCase() }
    }
}
