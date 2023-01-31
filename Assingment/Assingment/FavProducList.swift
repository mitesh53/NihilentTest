//
//  FavProducList.swift
//  Assingment
//
//  Created by Mitesh Rathore on 31/01/23.
//

import SwiftUI

struct FavProducList: View {
    @EnvironmentObject var viewModel : ProductListViewModle
    
    var body: some View {
        NavigationView {
            List() {
                ForEach($viewModel.prodcutList.products) { $product in
                    if  product.isFav == true {
                        NavigationLink(destination:ProductDescription(product: $product)) {
                            ProductListView(product: $product)
                        }
                    }
                }
            }
            .navigationTitle("Fav Product List")
        }
    }
}

struct FavProducList_Previews: PreviewProvider {
    static var previews: some View {
        FavProducList()
    }
}
