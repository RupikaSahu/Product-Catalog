//
//  ProductCatalogTests.swift
//  ProductCatalogTests
//
//  Created by Rupika Sahu on 28/09/20.
//  Copyright © 2020 Rupika Sahu. All rights reserved.
//

import XCTest
@testable import ProductCatalog

class ProductCatalogTests: XCTestCase {

    func testExample() throws {
        // Checking string Interpolayion
        let ratingCount = "(" + "\(10)" + ")"
        XCTAssert(ratingCount == "(10)", "Sucess")
        XCTAssertTrue(ratingCount != "10", "Succes")
        
        // Checking initial value of Products. Checking Nil
        let products = ProductViewModel().products
        XCTAssertNil(products)
        
        // Checking NSTextAttachment initialization
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "rating")!
        XCTAssertTrue(attachment.image != nil, "Sucess")
        
        let attach = NSTextAttachment(image: UIImage(named: "rating")!)
        XCTAssertTrue(attach.image == nil, "Sucess")
        XCTAssertNotNil(attach)
        
        // Checking ternary operator
        let a = "a"
        let x = a == "x" ? "x" : "a"
        let y = a == x ? "y" : "x"
        XCTAssertEqual(a, x, "Success")
        XCTAssertNotEqual(a, y, "Sucess")
    }
}
