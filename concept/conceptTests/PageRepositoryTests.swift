//
//  PageRepositoryTests.swift
//  conceptTests
//
//  Created by Kabir Khan on 23.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import XCTest
@testable import concept

class PageRepositoryTests: XCTestCase {
    
    struct PageRepo: PageRepository {
        var pageInfo: PageInfo
    }
  
    func testLoadMoreEnable() {
        let pageInfo = PageInfo(page: 0, pageSize: 12, totalPages: 4)
        let repo = PageRepo(pageInfo: pageInfo)
        XCTAssertTrue(repo.canLoadMore)
    }

    func testLoadMoreDisable() {
        let pageInfo = PageInfo(page: 4, pageSize: 12, totalPages: 4)
        let repo = PageRepo(pageInfo: pageInfo)
        XCTAssertFalse(repo.canLoadMore)
    }
}
