//
//  TestAppTests.swift
//  TestAppTests
//
//  Created by Vijay Masal on 14/04/20.
//  Copyright © 2020 Vijay Masal. All rights reserved.
//

import XCTest
@testable import TestApp

class TestAppTests: XCTestCase {

   func testSuccessfulInit() {
        let testSuccessfulJSON: JSON = [
            "title": "Beavers",
            "description": "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony",
            "imageHref": "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
        ]
     
     
     guard let title = testSuccessfulJSON["firstname"] as? String else {
         return
     }
     
     guard let description = testSuccessfulJSON["description"] as? String else {
                return
            }
     guard let imageHref = testSuccessfulJSON["imageHref"] as? String else {
                return
            }
     
        XCTAssertNotNil(Rows(title: title, description: description, imageHref: imageHref))
    }
}
