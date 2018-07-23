//
//  AppConfigurationTests.swift
//  conceptTests
//
//  Created by Kabir Khan on 23.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import XCTest
@testable import concept

class AppConfigurationTests: XCTestCase {
    
    let appConfig = AppConfiguration()
    
    func testAppConfig() {
        XCTAssertNotNil(appConfig.configurations)
    }
    
    func testApiInfo() {
       let apiInfo = appConfig.apiInfo
        XCTAssertNotNil(apiInfo.baseUri)
        XCTAssertNotEqual(apiInfo.baseUri, "Error: Please add the baseURi in concept/Core/AppConfiguration.plist")
        XCTAssertNotEqual(apiInfo.baseUri, "")
        
        XCTAssertNotNil(apiInfo.key)
        XCTAssertNotEqual(apiInfo.key, "Error: Please add the apiKey in concept/Core/AppConfiguration.plist")
        XCTAssertNotEqual(apiInfo.key, "")
    }
   
    func testPageSize() {
        XCTAssertNotNil(appConfig.pageSize)
        XCTAssertEqual(appConfig.pageSize, 15)
    }
 
}
