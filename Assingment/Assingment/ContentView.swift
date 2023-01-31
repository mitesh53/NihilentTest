//
//  ContentView.swift
//  Assingment
//
//  Created by Mitesh Rathore on 30/01/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ProductListViewModle()
    
    var body: some View {
        
        TabView {
            ProductList()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Products")
                }
            FavProducList()
                .tabItem {
                    Image(systemName: "star")
                    Text("Fav")
                }
        }.environmentObject(viewModel)
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




struct ProductList: View {
    @EnvironmentObject var viewModel : ProductListViewModle
    
    var body: some View {
        NavigationView {
            if viewModel.loadingState == .finish {
                List() {
                    ForEach($viewModel.prodcutList.products ) { $product in
                        NavigationLink(destination:ProductDescription(product: $product)) {
                            ProductListView(product: $product)
                        }
                    }
                    .navigationTitle("Product List")
                }
            }else {
                    ProgressView()
                }
            }
            .onAppear{
                if viewModel.prodcutList.products.isEmpty {
                    viewModel.fetchProductList()
                }
            }
        }
    }

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
