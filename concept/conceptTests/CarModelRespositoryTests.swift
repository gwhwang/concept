//
//  CarModelRespositoryTests.swift
//  conceptTests
//
//  Created by Kabir Khan on 24.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import XCTest
@testable import concept

class CarModelRespositoryTests: XCTestCase {
    
    var repo: CarModelRespository!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    private func setup(stub: StubType) {
        repo = Mocker.carModelRespository(stub: stub)
    }
    
    func testFetch() {
        setup(stub: .model_manufacturer_107_page_0)
        let expectation = XCTestExpectation(description: "com.concept.async.tsat")
        repo.get(for: "123") { (list, response) in
            XCTAssertEqual(list.count, 6)
            XCTAssertEqual(self.repo.pageInfo.page, 1)
            XCTAssertEqual(self.repo.pageInfo.pageSize, 15)
            XCTAssertEqual(self.repo.pageInfo.totalPages, 1)
            XCTAssertFalse(self.repo.canLoadMore)
            
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0)
    }
    
    func testFetchNoData() {
        setup(stub: .no_data)
       let expectation = XCTestExpectation(description: "com.concept.async.tsat")
        repo.get(for: "123") { (list, response) in
            
            XCTAssertEqual(list.count, 0)
            XCTAssertEqual(self.repo.pageInfo.page, 0)
            XCTAssertEqual(self.repo.pageInfo.pageSize, 15)
            XCTAssertEqual(self.repo.pageInfo.totalPages, 0)
            XCTAssertFalse(self.repo.canLoadMore)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
}
