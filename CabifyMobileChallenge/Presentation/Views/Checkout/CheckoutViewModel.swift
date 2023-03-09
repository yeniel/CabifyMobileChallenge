//
//  CheckoutViewModel.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation
import Combine
import Factory

class CheckoutViewModel: ObservableObject {
    @Published
    var status: ScreenStatus = .loading

    private var cancellables = Set<AnyCancellable>()
}
