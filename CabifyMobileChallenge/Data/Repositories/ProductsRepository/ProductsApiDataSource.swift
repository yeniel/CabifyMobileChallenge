//
//  ProductApiDataSource.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation
import Combine
import Factory

struct ProductsApiDataSource: ProductsDataSource {
    @Injected(\.urlSessionApiClient)
    private var apiClient: ApiClient

    // swiftlint:disable line_length
    private var path = "/palcalde/6c19259bd32dd6aafa327fa557859c2f/raw/ba51779474a150ee4367cda4f4ffacdcca479887/Products.json"
    // swiftlint:enable line_length

    func getProducts() -> AnyPublisher<ProductListDto, CabifyError> {
        apiClient.get(path: path)
    }

}
