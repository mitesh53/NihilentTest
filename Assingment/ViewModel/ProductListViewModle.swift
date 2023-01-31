//
//  ProductListViewModle.swift
//  Assingment
//
//  Created by Mitesh Rathore on 30/01/23.
//

import Foundation
import Combine


enum LoadingState {
  case loading, finish
}


class ProductListViewModle : ObservableObject {
    var anyCancellables = Set<AnyCancellable>()
    private let baseURLString = "https://run.mocky.io/"
    @Published var prodcutList : Products = Products.init(products: [])
    @Published var loadingState : LoadingState = .loading

    func fetchProductList() {
        // Simple GET Request
        // Downloading a single Decodable type
        CombineNetworkService(baseURLString: baseURLString).getPublisherForResponse(endpoint: "v3/2f06b453-8375-43cf-861a-06e95a951328", queryParameters: [:])
            .receive(on: DispatchQueue.main)
            .sink { _ in
                // no-op
            } receiveValue: { (products: Products) in
                self.loadingState = .finish
                self.prodcutList = products
            }.store(in: &anyCancellables)
    }
    
}

struct Products : Codable {
    var products : [Product]
}

struct Product: Codable, Identifiable {
    var id: String?
    var imageURL: String?
    var title: String?
    var price: [Price]
    var ratingCount: Double?
    var badges: [String]?
    var isFav: Bool? = false
}

struct Price: Codable {
    var message : String
    var value: Double
    var isOfferPrice: Bool
}

