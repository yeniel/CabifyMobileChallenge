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
    // Commented code because in this small project is not needed yet
//    func post<T>(path: String, data: T) -> AnyPublisher<T, CabifyError>
//    func put<T>(path: String, data: T) -> AnyPublisher<T, CabifyError>
//    func patch<T>(path: String, data: T) -> AnyPublisher<T, CabifyError>
//    func delete<T>(path: String) -> AnyPublisher<T, CabifyError>
}
