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
            let path = "v1/car-types/manufacturer"
            return "\(baseUri)/\(path)?page=\(page)&pageSize=\(pageSize)&wa_key=\(apiKey)"
        case .models(let baseUri, let apiKey, let mufactureId, let page, let pageSize):
            let path = "v1/car-types/main-types?manufacturer=\(mufactureId)"
            return "\(baseUri)/\(path)&page=\(page)&pageSize=\(pageSize)&wa_key=\(apiKey)"
        }
    }
    
}

