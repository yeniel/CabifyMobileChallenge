//
//  OrderRepositorySpec.swift
//  CabifyMobileChallengeTests
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Foundation
import Quick
import Nimble
import Combine
import Factory

class OrderRepositorySpec: QuickSpec {
    override func spec() {
        var mockOrderLocalDataSource: MockOrderLocalDataSource!
        var cancellables = Set<AnyCancellable>()
        var order: Order?

        beforeEach {
            Container.shared.manager.push()
            setupMocks()
        }

        afterEach {
            Container.shared.manager.pop()
        }

        describe("GIVEN an OrderRepository") {
            context("WHEN load an order") {
                it("THEN publishs an order") {
                    let repository = OrderRepositoryImpl()

                    repository.loadOrder().sink(
                        receiveCompletion: { _ in },
                        receiveValue: { order = $0 }
                    )
                    .store(in: &cancellables)

                    expect(order).toEventually(equal(ObjectMother.order))
                }
            }

            context("WHEN save an order") {
                it("THEN order is saved") {
                    let repository = OrderRepositoryImpl()

                    repository.saveOrder(order: ObjectMother.order)

                    expect(mockOrderLocalDataSource.orderSaved).toEventually(beTrue())
                    expect(mockOrderLocalDataSource.order).to(equal(ObjectMother.order))
                }
            }
        }

        func setupMocks() {
            mockOrderLocalDataSource = MockOrderLocalDataSource()
            Container.shared.orderLocalDataSource.register { mockOrderLocalDataSource }
        }
    }
}
