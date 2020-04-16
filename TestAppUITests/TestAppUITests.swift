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
           let tableCells = factTableView.cells
           if tableCells.count > 0 {
               let count: Int = (tableCells.count - 1)
            
               let promise = expectation(description: "Wait for table cells")
            
               for i in stride(from: 0, to: count , by: 1) {
                   // Grab the first cell and verify that it exists and tap it
                   let tableCell = tableCells.element(boundBy: i)
                   XCTAssertTrue(tableCell.exists, "The \(i) cell is in place on the table")
                  tableCell.tap()
                   if i == (count - 1) {
                       promise.fulfill()
                   }
               }
               waitForExpectations(timeout: 20, handler: nil)
               XCTAssertTrue(true, "Finished validating the table cells")
            
           } else {
               XCTAssert(false, "Was not able to find any table cells")
           }

           
       }
       
}
