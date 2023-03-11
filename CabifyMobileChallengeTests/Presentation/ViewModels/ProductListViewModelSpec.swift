//
//  ProductListViewModelSpec.swift
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

// swiftlint:disable function_body_length

class ProductListViewModelSpec: QuickSpec {
    override func spec() {
        var mockCoordinator: MockMainCoordinator!
        var mockSavedOrderUseCase: MockSaveOrderUseCase!

        beforeEach {
            Container.shared.manager.push()
            setupMocks()
        }

        afterEach {
            Container.shared.manager.pop()
        }

        describe("GIVEN a ProductListViewModel") {
            context("WHEN init") {
                it("THEN publishs a product ui model list") {
                    let viewModel = ProductListViewModel(coordinator: mockCoordinator)

                    expect(viewModel.products).toEventually(equal(ObjectMother.productUIModelList()))
                }

                it("THEN publishs loaded status") {
                    let viewModel = ProductListViewModel(coordinator: mockCoordinator)

                    expect(viewModel.status).toEventually(equal(.loaded))
                }
            }

            context("WHEN checkout") {
                it("THEN order is saved") {
                    let viewModel = ProductListViewModel(coordinator: mockCoordinator)

                    viewModel.checkout()

                    expect(mockSavedOrderUseCase.orderSaved).toEventually(beTrue())
                    expect(mockSavedOrderUseCase.order).to(equal(Order(items: [])))
                }

                it("THEN order is saved with selected quantities") {
                    let viewModel = ProductListViewModel(coordinator: mockCoordinator)

                    viewModel.products = ObjectMother.productUIModelList(quantity: 3)

                    viewModel.checkout()

                    expect(mockSavedOrderUseCase.orderSaved).toEventually(beTrue())
                    expect(mockSavedOrderUseCase.order).to(equal(ObjectMother.orderWithSortedItems))
                }

                it("THEN routes to checkout view") {
                    let viewModel = ProductListViewModel(coordinator: mockCoordinator)

                    viewModel.checkout()

                    expect(mockCoordinator.routedToCheckout).toEventually(beTrue())
                }
            }
        }

        func setupMocks() {
            Container.shared.loadProductsUseCase.register { MockLoadProductsUseCase() }

            mockSavedOrderUseCase = MockSaveOrderUseCase()

            Container.shared.saveOrderUseCase.register { mockSavedOrderUseCase }

            mockCoordinator = MockMainCoordinator()

            let mockNavigationRouter = NavigationRouter(
                id: 0,
                coordinator: mockCoordinator as MainCoordinatorProtocol
            )

            RouterStore.shared.store(router: mockNavigationRouter)
        }
    }
}

// swiftlint:enable function_body_length
