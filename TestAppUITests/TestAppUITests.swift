//
//  TestAppUITests.swift
//  TestAppUITests
//
//  Created by Vijay Masal on 16/04/20.
//  Copyright © 2020 Vijay Masal. All rights reserved.
//
import XCTest
class TestAppUITests: XCTestCase {
    func testFactTableView() {
           let app = XCUIApplication()
           app.launch()
            print(app.debugDescription)
          let factTableView = app.tables["factTableView"]
         XCTAssertTrue(factTableView.exists, "The fact tableview exists")
       }
}
