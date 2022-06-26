//
//  Apple.swift
//  AppleMart
//
//  Created by Kant on 2022/06/26.
//

import SwiftUI

struct AppleStore: View {
    var body: some View {
        ScrollView{
            VStack {
                ProductRow(product: productSamples[0])
                ProductRow(product: productSamples[1])
                ProductRow(product: productSamples[2])
                ProductRow(product: productSamples[3])
                ProductRow(product: productSamples[4])
            }
        }
    }
}

struct Apple_Previews: PreviewProvider {
    static var previews: some View {
        AppleStore()
    }
}
