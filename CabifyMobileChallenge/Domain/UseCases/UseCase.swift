//
//  UseCase.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation

protocol UseCase {
    associatedtype ResponseType

    func execute() -> ResponseType
}
