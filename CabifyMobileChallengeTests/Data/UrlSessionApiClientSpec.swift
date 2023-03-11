//
//  UrlSessionApiClientSpec.swift
//  CabifyMobileChallengeTests
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Combine
import Factory
import Foundation
import OHHTTPStubs
import OHHTTPStubsSwift
import Quick
import Nimble

class UrlSessionApiClientSpec: QuickSpec {
    // sswiftlint:disable line_length
    var host = "gist.githubusercontent.com"
    var productsPath = "/palcalde/6c19259bd32dd6aafa327fa557859c2f/raw/ba51779474a150ee4367cda4f4ffacdcca479887/Products.json"
    // sswiftlint:enable line_length

    override func spec() {
        var cancellables = Set<AnyCancellable>()
        var productListDto: ProductListDto?
        var error: CabifyError?

        beforeEach {
            productListDto = nil
            error = nil
            self.setupStubs()
        }

        describe("GIVEN a UrlSessionApiClient") {
            context("WHEN request a product list") {
                it("THEN publishs a product list dto") {
                    let apiClient = UrlSessionApiClient()

                    apiClient.get(path: self.productsPath)
                        .sink(
                            receiveCompletion: { _ in },
                            receiveValue: { productListDto = $0 }
                        )
                        .store(in: &cancellables)

                    expect(productListDto).toEventually(equal(ObjectMother.productListDto))
                }
            }

            context("WHEN request and receive an error") {
                it("THEN publishs a CabifyError.networkError") {
                    stub(condition: isHost(self.host)
                         && isPath(self.productsPath)
                         && isMethodGET()
                    ) { _ in
                        let notConnectedError = NSError(
                            domain: NSURLErrorDomain,
                            code: URLError.notConnectedToInternet.rawValue
                        )
                        return HTTPStubsResponse(error: notConnectedError)
                    }

                    let apiClient = UrlSessionApiClient()

                    apiClient.get(path: self.productsPath)
                        .catch { errorCatched -> AnyPublisher<ProductListDto, CabifyError> in
                            error = errorCatched
                            return Fail(error: errorCatched).eraseToAnyPublisher()
                        }
                        .sink(
                            receiveCompletion: { _ in },
                            receiveValue: { productListDto = $0 }
                        )
                        .store(in: &cancellables)

                    expect(productListDto).toEventually(beNil())
                    expect(error).toEventually(equal(.networkError))
                }
            }
        }
    }

    func setupStubs() {
        stub(condition: isHost(host)
             && isPath(productsPath)
             && isMethodGET()
        ) { _ in
            let stubPath = OHPathForFile("product_list.json", type(of: self))

            return fixture(filePath: stubPath!, headers: ["Content-Type": "application/json"])
        }
    }
}
