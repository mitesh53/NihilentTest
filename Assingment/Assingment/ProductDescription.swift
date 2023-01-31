//
//  ProductDescription.swift
//  Assingment
//
//  Created by Mitesh Rathore on 31/01/23.
//

import SwiftUI

struct ProductDescription: View {
    @Binding var product: Product
    
    init(product: Binding<Product>) {
        self._product = product
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack (alignment: .bottomLeading){
                ZStack(alignment: .bottomTrailing) {
                    AsyncImageWithURL(url: product.imageURL ?? "", maxWidth: .infinity, maxHeight: 200)
                    if !(product.badges?.isEmpty ?? true) {
                        AsyncImageWithURL(url:product.badges?.first ?? "", maxWidth: 50, maxHeight: 50).padding(.trailing, 10)
                    }
                }
                Button(action: {
                    product.isFav = !(product.isFav ?? false)
                }) {
                    HStack(alignment: .center, spacing: 5.0) {
                        Image(systemName:  product.isFav ?? false ? "star.fill" : "star")
                            .renderingMode(.template)
                            .colorMultiply(.gray)
                    }
                }
                .padding(.leading, 10)
                .buttonStyle(.borderless)
            }
            Divider()
            Text(product.title ?? "")
            Text("Rating: \(product.ratingCount ?? 0.0)")
            Text("Price: \(product.price.first?.value ?? 0.0)")
            Spacer()
        }
    }
}

