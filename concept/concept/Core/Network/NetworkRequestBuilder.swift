//
//  NetworkRequestBuilder.swift
//  Concept
//
//  Created by Kabir Khan on 20.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

enum NetworkRequestBuilder {

    case manufactures(baseUri: String, apiKey: String, page: Int, pageSize: Int)
    case models(baseUri: String, apiKey: String, mufactureId: String, page: Int, pageSize: Int)
    
    func build() -> String {
        switch self {
        case .manufactures(let baseUri, let apiKey, let page, let pageSize):
            return url(baseUri: baseUri,
                       path: "v1/car-types/manufacturer",
                       page: page,
                       pageSize: pageSize,
                       apiKey: apiKey)
        case .models(let baseUri, let apiKey, let mufactureId, let page, let pageSize):
            return url(baseUri: baseUri,
                       path: "v1/car-types/main-types?manufacturer=\(mufactureId)",
                       page: page,
                       pageSize: pageSize,
                       apiKey: apiKey)
        }
    }
    
    private func url(baseUri: String,
                     path: String,
                     page: Int,
                     pageSize: Int,
                     apiKey: String) -> String {
        return "\(baseUri)/\(path)?page=\(page)&pageSize=\(pageSize)&wa_key=\(apiKey)"
    }
    
}

