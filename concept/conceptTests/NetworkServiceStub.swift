//
//  NetworkServiceStub.swift
//  conceptTests
//
//  Created by Kabir Khan on 23.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import SwiftyJSON
@testable import concept

enum StubType: String {
    
    case manufacturers_page_0
    case model_manufacturer_107_page_0
    case no_data
    
}


protocol NetworkServiceStubProtocol {
    
    func get(resource: String, ext: String) -> NetworkDataResponse
}


class NetworkServiceStub: NetworkServiceStubProtocol {
    
    let stub: StubType
    init(stub: StubType) {
        self.stub = stub
    }
    
    func get(resource: String, ext: String) -> NetworkDataResponse {
        let bundle = Bundle(for: type(of: self))
        guard let file = bundle.url(forResource: resource, withExtension: ext),
            let data = try? Data(contentsOf: file) else {
                return networkDataResponse(from: nil)
        }
        
        let json = try? JSON(data: data)
        return networkDataResponse(from: json)
    }
    
    private func networkDataResponse(from json: JSON?) -> NetworkDataResponse {
        let error = NetworkErrorBuilder.build(from: json, error: nil)
        let response = NetworkDataResponse(json: json,
                                           result: .success,
                                           error: error)
        
        return response
    }
}


extension NetworkServiceStub: NetworkServiceProvider {
    
    func request(_ url: String,
                 method: RequestHTTPMethod,
                 parameters: [String : Any]?,
                 headers: [String : String]?,
                 onComplete: @escaping ((NetworkDataResponse) -> Void)) {
        
        onComplete (get(resource: stub.rawValue, ext: "json"))
    }
    
}
