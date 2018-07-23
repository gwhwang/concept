//
//  NetworkService.swift
//  Concept
//
//  Created by Kabir Khan on 18.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct NetworkService: NetworkServiceProvider {
    
    let dispatchQueue = DispatchQueue(label: "queue.concept.parser")
    
    init() {
        setup()
    }
    
    private func setup() {
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        manager.session.configuration.timeoutIntervalForRequest = 25 // In sec
        manager.session.configuration.urlCache = nil
        let delegate = manager.delegate
        delegate.dataTaskWillCacheResponse = { session, task, response in
            return nil
        }
    }
    
    func request(_ url: String,
                 method: RequestHTTPMethod = .get,
                 parameters: [String : Any]? = nil,
                 headers: [String: String]? = nil,
                 onComplete: @escaping ((NetworkDataResponse) -> Void)) {
        
        let httpMethod = HTTPMethod(rawValue: method.rawValue) ?? .get
        Alamofire.request(url,
                          method: httpMethod,
                          parameters: parameters,
                          encoding: httpMethod == .get ? URLEncoding.default:JSONEncoding.default,
                          headers: headers)
            .validate(statusCode: 200..<300)
            .responseData(queue: self.dispatchQueue) { (response) in

                let dataResponse = ResponseTransformer(dataResponse: response).transform()
                onComplete(dataResponse)
        }
        
    }
    
}

fileprivate struct ResponseTransformer<T> {
    
    let dataResponse: DataResponse<T>
    
    func transform() -> NetworkDataResponse {
        var json: JSON?
        if let value = dataResponse.data {
            json = JSON(value)
        }
        let error = NetworkErrorBuilder.build(from: json, error: dataResponse.result.error)
        
        let result: NetworkResult = error == nil ? .success : .failure
        let response = NetworkDataResponse(json: json,
                                           result: result,
                                           error: error)
        return response
    }
    
}
