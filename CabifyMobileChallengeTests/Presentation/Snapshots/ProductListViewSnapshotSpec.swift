//
//  ProductListViewSnapshotSpec.swift
//  CabifyMobileChallengeTests
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Factory
import SnapshotTesting
import Quick
import Nimble

class ProductListViewSnapshotSpec: QuickSpec {
    override func spec() {
        var mockCoordinator: MockMainCoordinator!

        isRecording = false

        beforeEach {
            Container.shared.manager.push()
            setupMocks()
        }

        afterEach {
            Container.shared.manager.pop()
        }

        describe("GIVEN a ProductListView") {
            context("WHEN init") {
                it("THEN snapshot match dark") {
                    let viewModel = ProductListViewModel(coordinator: mockCoordinator)
                    let view = ProductListView(viewModel: viewModel)

                    assertSnapshot(
                        matching: view,
                        as: .image(
                            layout: .fixed(width: 375, height: 667),
                            traits: .init(userInterfaceStyle: .dark)
                        )
                    )
                }
            }
        }

        func setupMocks() {
            Container.shared.loadProductsUseCase.register { MockLoadProductsUseCase() }
            Container.shared.saveOrderUseCase.register { MockSaveOrderUseCase() }
            mockCoordinator = MockMainCoordinator()
        }
    }
}
