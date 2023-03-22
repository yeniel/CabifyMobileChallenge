//
//  ApiClient.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 8/3/23.
//

import Foundation
import Combine

protocol ApiClient {
    func get<T: Decodable>(path: String) -> AnyPublisher<T, CabifyError>
}
