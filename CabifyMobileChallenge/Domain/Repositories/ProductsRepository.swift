//
//  ProductRepository.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation
import Combine

protocol ProductsRepository {
    func loadProducts() -> AnyPublisher<[Product], CabifyError>
}
