//
//  CheckoutViewSnapshotSpec.swift
//  CabifyMobileChallengeTests
//
//  Created by Yeniel Landestoy on 11/3/23.
//

import Factory
import SnapshotTesting
import Quick
import Nimble

class CheckoutViewSnapshotSpec: QuickSpec {
    override func spec() {
        isRecording = false

        beforeEach {
            Container.shared.manager.push()
            setupMocks()
        }

        afterEach {
            Container.shared.manager.pop()
        }

        describe("GIVEN a CheckoutView") {
            context("WHEN init") {
                it("THEN snapshot match dark") {
                    let viewModel = CheckoutViewModel()
                    let view = CheckoutView(viewModel: viewModel)

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
            Container.shared.loadOrderUseCase.register { MockLoadOrderUseCase() }
        }
    }
}
