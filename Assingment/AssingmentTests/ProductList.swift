//
//  ProductList.swift
//  AssingmentTests
//
//  Created by Mitesh Rathore on 31/01/23.
//

import XCTest
import Combine
@testable import Assingment

final class ProductList: XCTestCase {
    let viewModel = ProductListViewModle()
    fileprivate let product1 = Product(id: "1",
                                       imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM",
                                       title: "Diamond Label Shiraz",
                                       price: [Price(message: "in any six", value: 10.0, isOfferPrice: false)], ratingCount: 4.0, badges: ["https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png"], isFav: false)
    fileprivate let product2 = Product(id: "2",
                                       imageURL: "https://media.danmurphys.com.au/dmo/product/144469-1.png?impolicy=PROD_SM",
                                       title: "Shiraz",
                                       price: [Price(message: "in any six", value: 10.0, isOfferPrice: false)], ratingCount: 4.0, badges: ["https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png"], isFav: false)
    fileprivate let product3 = Product(id: "3",
                                       imageURL: "https://media.danmurphys.com.au/dmo/product/144469-1.png?impolicy=PROD_SM",
                                       title: "Shiraz",
                                       price: [Price(message: "in any six", value: 10.0, isOfferPrice: false)], ratingCount: 4.0, badges: ["https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png"], isFav: false)
    
    fileprivate let product4 = Product(id: "4",
                                       imageURL: "https://media.danmurphys.com.au/dmo/product/144469-1.png?impolicy=PROD_SM",
                                       title: "Shiraz",
                                       price: [Price(message: "in any six", value: 10.0, isOfferPrice: false)], ratingCount: 4.0, badges: ["https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png"], isFav: true)
    
    
    fileprivate var productsList : [Product] = []
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        productsList = [product1, product2, product2]
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testData() async {
        XCTAssertTrue(productsList.count > 1)
        XCTAssertNotNil(productsList.first?.title)
        XCTAssertNotNil(productsList.first?.imageURL)
        XCTAssertNotNil(productsList.first?.id)
    }
    
    func testIsNotFav() async {
        XCTAssertTrue(productsList.first?.isFav == false)
    }
    
    func testIsFav() async {
        XCTAssertTrue(product4.isFav == true)
    }
    
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}



