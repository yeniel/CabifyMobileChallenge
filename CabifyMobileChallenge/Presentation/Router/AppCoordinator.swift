//
//  AppCoordinator.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation
import Stinsen
import Factory
import SwiftUI

final class AppCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \AppCoordinator.start)

    lazy var routerStorable: AppCoordinator = self

    @Root
    var start = makeStart

    func makeStart() -> NavigationViewCoordinator<MainCoordinator> {
        NavigationViewCoordinator(MainCoordinator())
    }

}
