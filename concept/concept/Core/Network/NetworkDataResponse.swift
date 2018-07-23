//
//  NetworkDataResponse.swift
//  Concept
//
//  Created by Kabir Khan on 18.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import SwiftyJSON

struct NetworkError {
    
    let title: String
    let description: String
    let error: Error?
}

enum NetworkResult {
    
    case success,
    failure
}

struct NetworkDataResponse {
    
    let json: JSON?
    let result: NetworkResult
    var error: NetworkError?
}


enum RequestError: Error {
    
    case invalidRequest
}
