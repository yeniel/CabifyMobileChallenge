//
//  ProductsRepositorySpec.swift
//  CabifyMobileChallengeTests
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Factory
import Foundation
import Quick
import Nimble
import Combine

class ProductsRepositorySpec: QuickSpec {
    override func spec() {
        var cancellables = Set<AnyCancellable>()
        var products: [Product]?

        beforeEach {
            Container.shared.manager.push()
            self.setupMocks()
        }

        afterEach {
            Container.shared.manager.pop()
        }

        describe("GIVEN a ProductRepository") {
            context("WHEN load products") {
                it("THEN publishs a product list") {
                    let repository = ProductsRepositoryImpl()

                    repository.loadProducts().sink(
                        receiveCompletion: { _ in },
                        receiveValue: { products = $0 }
                    )
                    .store(in: &cancellables)

                    expect(products).toEventually(equal(ObjectMother.productList))
                }
            }
        }
    }

    func setupMocks() {
        Container.shared.urlSessionApiClient.register {
            MockApiClient<ProductListDto>(data: ObjectMother.productListDto)
        }
    }
}
