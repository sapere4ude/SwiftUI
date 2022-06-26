//
//  ProductRow.swift
//  AppleMart
//
//  Created by Kant on 2022/06/26.
//

import SwiftUI

struct ProductRow: View {
    let product: Product
    var body: some View {
        HStack(spacing: 20) {
            productImage
            productDescription
        }
        .frame(width: 360, height: 150)
        .background(Color.primary.colorInvert())
        .cornerRadius(6)
        .shadow(color: Color.primary.opacity(0.2), radius: 1, x: 2, y: 2)
        .padding(.vertical, 8)
    }
}

//struct ProductRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductRow()
//    }
//}

private extension ProductRow {
    var productImage: some View {
        Image(product.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 140, height: 150)
            .clipped()
    }
    var productDescription: some View {
        VStack(alignment: .leading) {
            Text(product.name)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 6)
            Text(product.description)
                .font(.footnote)
                .foregroundColor(Color.gray)
            Spacer()
            footerView
        }
    }
    var footerView: some View {
        HStack(spacing: 0) {
            Text("₩").font(.footnote) + Text("\(product.price)").font(.headline)
            Spacer()
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(Color.gray)
                .frame(width: 32, height: 32)
            
            Image(systemName: "cart")
                .foregroundColor(Color.gray)
                .frame(width: 32, height: 32)
        }
        .padding([.leading, .bottom], 12)
        .padding([.top, .bottom])
    }
}
