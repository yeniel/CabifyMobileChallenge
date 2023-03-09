//
//  ProductRepositoryImpl.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation
import Combine
import Factory

struct ProductsRepositoryImpl: ProductsRepository {
    @Injected(\.productsApiDataSource)
    private var apiDataSource: ProductsDataSource

    @Injected(\.dtoMapper)
    private var dtoMapper: DtoMapper

    func getProducts() -> AnyPublisher<[Product], CabifyError> {
        apiDataSource.getProducts()
            .map { dtoMapper.productListDtoToProductList(dto: $0) }
            .eraseToAnyPublisher()
    }
}
