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
   var appServerClient = AppServerClient()
    func testApiCalls() {
       let e = expectation(description: "Alamofire")
       appServerClient.getFacts(completion: { [weak self] result in
           switch result {
               case .success(let facts):
                  XCTAssertNotNil(facts.title)
                  XCTAssertTrue(facts.row.count > 0)
                   XCTAssertNotNil(facts.row[0])
                   XCTAssertNotNil(facts.row[0])
                    e.fulfill()
               case .failure(let error):
                   print("Error \(error.debugDescription)")
               }
           })
        waitForExpectations(timeout: 5.0, handler: nil)
         }
}
