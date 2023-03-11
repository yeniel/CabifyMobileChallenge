//
//  LoadOrderUseCaseSpec.swift
//  CabifyMobileChallengeTests
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Foundation
import Quick
import Nimble
import Combine
import Factory

class LoadOrderUseCaseSpec: QuickSpec {
    override func spec() {
        var cancellables = Set<AnyCancellable>()
        var order: Order?

        beforeEach {
            Container.shared.manager.push()
            self.setupMocks()
        }

        afterEach {
            Container.shared.manager.pop()
        }

        describe("GIVEN an order repository") {
            context("WHEN execute load order use case") {
                it("THEN publishs a order with sorted by name order item list") {
                    let repository = LoadOrderUseCaseImpl()

                    repository.execute().sink(
                        receiveCompletion: { _ in },
                        receiveValue: { order = $0 }
                    )
                    .store(in: &cancellables)

                    expect(order).toEventually(equal(ObjectMother.orderWithSortedItems))
                }
            }
        }
    }

    func setupMocks() {
        Container.shared.orderRepository.register { MockOrderRepository() }
    }
}
