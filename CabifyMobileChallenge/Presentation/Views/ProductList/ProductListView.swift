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
            List {
                ForEach($viewModel.products) { $product in
                    ProductCell(product: $product)
                }
            }
            .alert("Unknown Error", isPresented: $viewModel.showError) {
                Button("OK", role: .cancel) { }
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
                    .font(.callout)
                Text(product.formattedPrice)
                    .font(.title3)
                    .fontWeight(.bold)
            }
            Spacer()
            Text(String(product.quantity))
                .font(.title2)
                .foregroundColor(Color.red)
            Stepper("", value: $product.quantity, in: 0...Int.max)
                .labelsHidden()
        }
        .contentShape(Rectangle())
    }
}
