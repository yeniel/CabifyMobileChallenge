//
//  ProductsDataSource.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation
import Combine

protocol ProductsDataSource {
    func loadProducts() -> AnyPublisher<ProductListDto, CabifyError>
}
