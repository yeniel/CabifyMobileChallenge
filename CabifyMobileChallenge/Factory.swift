//
//  Factory.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation
import Factory

extension Container {
    // MARK: Repositories

    var productsRepository: Factory<ProductsRepository> {
        Factory(self) { ProductsRepositoryImpl() }
    }

    var productsApiDataSource: Factory<ProductsDataSource> {
        Factory(self) { ProductsApiDataSource() }
    }

    // MARK: Services

    var urlSessionApiClient: Factory<ApiClient> {
        Factory(self) { UrlSessionApiClient() }
    }

    // MARK: Mappers

    var dtoMapper: Factory<DtoMapper> {
        Factory(self) { DtoMapper() }
    }

    // MARK: Use Cases

    var getProductsUseCase: Factory<GetProductsUseCase> {
        Factory(self) { GetProductsUseCase() }
    }
}
