//
//  AppConfiguration+ApiInfo.swift
//  Concept
//
//  Created by Kabir Khan on 21.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

extension AppConfiguration {
    
    private struct Keys {
        static let baseUri = "baseUri"
        static let apiKey = "apiKey"
    }
    
    private var baseUri: String {
        guard let uri = configurations?[Keys.baseUri] as? String else {
            return ""
        }
        return uri
    }
    private var apiKey: String {
        guard let key = configurations?[Keys.apiKey] as? String else {
            return ""
        }
        return key
    }
    
    var apiInfo: ApiInfo {
        return ApiInfo(key: apiKey, baseUri: baseUri)
    }
}
