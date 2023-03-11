//
//  ProductListView.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Combine
import Factory
import Foundation
import SwiftUI

struct ProductListView: View {
    @ObservedObject
    var viewModel: ProductListViewModel

    init(viewModel: ProductListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        switch viewModel.status {
        case .loading:
            VStack {
                ProgressView()
            }
        case .loaded:
            VStack {
                List {
                    ForEach($viewModel.products) { $product in
                        ProductCell(product: $product)
                    }
                }
                Spacer()
                Button {
                    viewModel.routeToCheckout()
                } label: {
                  Text("Checkout")
                }
                .buttonStyle(.bordered)
            }

        }
    }
}

struct ProductCell: View {
    @Binding
    var product: ProductUIModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.body)
                Text(product.formattedPrice)
                    .font(.title3)
                    .fontWeight(.bold)
            }
            Spacer()
            Text(String(product.quantity))
                .font(.title3)
                .foregroundColor(Color.red)
            Stepper("", value: $product.quantity, in: 0...Int.max)
                .labelsHidden()
        }
        .contentShape(Rectangle())
    }
}
