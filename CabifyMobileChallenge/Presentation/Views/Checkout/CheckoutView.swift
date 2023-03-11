//
//  CheckoutView.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation
import SwiftUI

struct CheckoutView: View {
    @ObservedObject
    var viewModel: CheckoutViewModel

    init(viewModel: CheckoutViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            ForEach($viewModel.orderItems) { $orderItem in
                OrderItemCell(orderItem: orderItem)
            }
        }
        Spacer()
        HStack {
            Text("Total:")
                .font(.title)
            Spacer()
            Text(viewModel.totalPrice)
                .font(.title)
                .bold()
        }
        .padding()
    }
}

struct OrderItemCell: View {
    let orderItem: OrderItemUIModel

    var body: some View {
        VStack {
            HStack {
                Text(orderItem.productName)
                    .font(.body)
                Text("x\(orderItem.quantity)")
                    .font(.body)
                    .foregroundColor(Color.red)
                Spacer()
                Text(orderItem.formattedPrice)
                    .font(.body)
            }
            ForEach(orderItem.discounts) { discount in
                OrderDiscountCell(discount: discount)
            }
        }
        .contentShape(Rectangle())
    }
}

struct OrderDiscountCell: View {
    let discount: DiscountUIModel

    var body: some View {
        HStack {
            Text(discount.name)
                .font(.callout)
                .foregroundColor(Color.green)
            Spacer()
            Text("- \(discount.amount)")
                .font(.callout)
                .foregroundColor(Color.green)
        }
        .contentShape(Rectangle())
    }
}
