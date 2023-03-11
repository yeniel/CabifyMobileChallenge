//
//  CheckoutViewModeSpec.swift
//  CabifyMobileChallengeTests
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Combine
import Factory
import Foundation
import Nimble
import Quick
import Stinsen

class CheckoutViewModelSpec: QuickSpec {
    override func spec() {
        var mockCoordinator: MockMainCoordinator!

        beforeEach {
            Container.shared.manager.push()
            setupMocks()
        }

        afterEach {
            Container.shared.manager.pop()
        }

        describe("GIVEN a CheckoutViewModel with an order of 3 items of each produts") {
            context("WHEN init") {
                it("THEN publishs an order items ui model list") {
                    let viewModel = CheckoutViewModel()

                    expect(viewModel.orderItems).toEventually(equal(ObjectMother.orderItemsUIModelList))
                }

                it("THEN publishs the total price") {
                    let viewModel = CheckoutViewModel()

                    expect(viewModel.totalPrice).toEventually(equal("89,50 €"))
                }
            }
        }

        func setupMocks() {
            Container.shared.loadOrderUseCase.register { MockLoadOrderUseCase() }

            mockCoordinator = MockMainCoordinator()

            let mockNavigationRouter = NavigationRouter(
                id: 0,
                coordinator: mockCoordinator as MainCoordinatorProtocol
            )

            RouterStore.shared.store(router: mockNavigationRouter)
        }
    }
}
