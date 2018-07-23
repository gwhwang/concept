//
//  NetworkAdaptor.swift
//  Concept
//
//  Created by Kabir Khan on 18.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

enum RequestHTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

protocol NetworkServiceProvider {
    
    func request(_ url: String,
                 method: RequestHTTPMethod,
                 parameters: [String: Any]?,
                 headers: [String: String]?,
                 onComplete: @escaping ((NetworkDataResponse) -> Void))
}

extension NetworkServiceProvider {
    
    func request(_ url: String,
                 method: RequestHTTPMethod = .get,
                 parameters: [String : Any]? = nil,
                 headers: [String: String]? = nil,
                 onComplete: @escaping ((NetworkDataResponse) -> Void)) {
        
        request(url, method: method,
                parameters: parameters,
                headers: headers,
                onComplete: onComplete)
    }
}
