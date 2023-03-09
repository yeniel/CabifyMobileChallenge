//
//  MainCoordinator.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation
import Stinsen
import SwiftUI

protocol MainCoordinatorProtocol {
    func routeToCheckout()
}

final class MainCoordinator: MainCoordinatorProtocol, NavigationCoordinatable {
    let stack = NavigationStack(initial: \MainCoordinator.start)

    lazy var routerStorable: MainCoordinator = self

    @Root
    var start = makeStart

    @Route(.push)
    var checkout = makeCheckoutView

    @ViewBuilder
    func makeStart() -> some View {
        let viewModel = ProductListViewModel(coordinator: self)

        ProductListView(viewModel: viewModel)
    }

    @ViewBuilder
    func makeCheckoutView() -> some View {
        let viewModel = CheckoutViewModel()

        CheckoutView(viewModel: viewModel)
    }

    func routeToCheckout() {
        route(to: \.checkout)
    }
}
