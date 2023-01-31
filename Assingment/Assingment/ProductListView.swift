//
//  ProductListView.swift
//  Assingment
//
//  Created by Mitesh Rathore on 30/01/23.
//

import SwiftUI

struct ProductListView: View {
    @Binding var product: Product
    
    init(product: Binding<Product>) {
        self._product = product
    }
    
    var body: some View {
        
        HStack {
            AsyncImageWithURL(url: product.imageURL, maxWidth: 50, maxHeight: 50)
            Text(product.title ?? "")
            Spacer()
            Button(action: {
                product.isFav = !(product.isFav ?? false)
            }) {
                HStack(alignment: .center, spacing: 5.0) {
                    Image(systemName:  product.isFav ?? false ? "star.fill" : "star")
                        .renderingMode(.template)
                          .colorMultiply(.gray)
                }
            }.buttonStyle(.borderless)
        }
    }
}






