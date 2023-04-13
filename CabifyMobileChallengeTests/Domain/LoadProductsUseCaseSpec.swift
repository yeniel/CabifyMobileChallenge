//
//  LoadProductsUseCaseSpec.swift
//  CabifyMobileChallengeTests
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Foundation
import Quick
import Nimble
import Combine
import Factory

class LoadProductsUseCaseSpec: QuickSpec {
    override func spec() {
        var cancellables = Set<AnyCancellable>()
        var products: [Product] = []

        beforeEach {
            Container.shared.manager.push()
            setupMocks()
        }

        afterEach {
            Container.shared.manager.pop()
        }

        describe("GIVEN an unsorted products from repository") {
            context("WHEN execute load product use case") {
                it("THEN publishs a sorted by name product list") {
                    let useCase = LoadProductsUseCaseImpl()

                    useCase.execute().sink(
                        receiveCompletion: { _ in },
                        receiveValue: { products = $0 }
                    )
                    .store(in: &cancellables)

                    expect(products).toEventually(equal(ObjectMother.sortedProductList))
                }
            }
        }

        func setupMocks() {
            Container.shared.productsRepository.register { MockProductsRepository() }
        }
    }
}
