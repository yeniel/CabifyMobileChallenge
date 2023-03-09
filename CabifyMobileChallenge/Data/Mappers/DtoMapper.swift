//
//  DtoMapper.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 9/3/23.
//

import Foundation

struct DtoMapper {
    func productListDtoToProductList(dto: ProductListDto) -> [Product] {
        dto.products.map { productDtoToProduct(dto: $0) }
    }

    func productDtoToProduct(dto: ProductDto) -> Product {
        Product(
            type: mapProductCode(code: dto.code),
            name: dto.name,
            price: dto.price
        )
    }

    private func mapProductCode(code: String) -> ProductType {
        switch code {
        case "VOUCHER":
            return .voucher
        case "TSHIRT":
            return .tshirt
        case "MUG":
            return .mug
        default:
            return .unknown
        }
    }
}
