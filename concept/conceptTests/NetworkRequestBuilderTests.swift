//
//  NetworkRequestBuilderTests.swift
//  conceptTests
//
//  Created by Kabir Khan on 23.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import XCTest
@testable import concept

class NetworkRequestBuilderTests: XCTestCase {
    
    let baseUri = "http://api-aws-eu-qa-1.auto1-test.com"
    let apiKey = "coding-puzzle-client-449cc9d"
    let page = 0
    let pageSize = 10
    
    func testManufactureUri() {
        let path = "v1/car-types/manufacturer"
        let uri = NetworkRequestBuilder.manufactures(baseUri: baseUri,
                                                     apiKey: apiKey,
                                                     page: page,
                                                     pageSize: pageSize)
        .build()
        XCTAssertEqual(uri, "\(baseUri)/\(path)?page=\(page)&pageSize=\(pageSize)&wa_key=\(apiKey)")

    }
    
    func testModelUri() {
        let mufactureId = "107"
        let path = "v1/car-types/main-types?manufacturer=\(mufactureId)"
        let uri = NetworkRequestBuilder.models(baseUri: baseUri,
                                               apiKey: apiKey,
                                               mufactureId: mufactureId,
                                               page: page,
                                               pageSize: pageSize)
            .build()
        XCTAssertEqual(uri, "\(baseUri)/\(path)&page=\(page)&pageSize=\(pageSize)&wa_key=\(apiKey)")        
    }
    
}
