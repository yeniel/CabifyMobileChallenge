//
//  UrlSessionApiClient.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 8/3/23.
//

import Foundation
import Combine

struct UrlSessionApiClient: ApiClient {
    static let host = "https://gist.githubusercontent.com"
    let decoder: JSONDecoder = .init()

    func get<T: Decodable>(path: String) -> AnyPublisher<T, CabifyError> {
        URLSession.shared
            .dataTaskPublisher(for: configureUrlRequest(path: path))
            .tryMap { result -> T in
                try self.decoder.decode(T.self, from: result.data)
            }
            .mapError { _ -> CabifyError in
                // Here we can map the UrlSessionApiClient specific errors
                // to domain errors CabifyError.
                // For now we don't have any specification of the api errors
                CabifyError.networkError
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    private func configureUrlRequest(path: String, method: HttpMethod = .GET) -> URLRequest {
        let url = URL(string: "\(UrlSessionApiClient.host)/\(path)")
        var request = URLRequest(url: url!)

        request.httpMethod = method.rawValue
        request.addValue("application/json; charset=iso-8859-1", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        return request
    }
}

enum HttpMethod: String {
    case GET
    case POST
    case PATCH
    case PUT
    case DELETE
}
