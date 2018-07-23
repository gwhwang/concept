//
//  CarManufactureUseCase.swift
//  Concept
//
//  Created by Kabir Khan on 20.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

protocol CarManufactureUseCaseAdapter {
    
    typealias Completion = ([CarManufacture]?, PageInfo?, NetworkDataResponse) -> Void
    
    func get(page: Int,
             pageSize: Int,
             onComplete: @escaping Completion)
}

struct CarManufactureUseCase: CarManufactureUseCaseAdapter, PageUseCase {
    
    let service: NetworkServiceProvider
    let apiInfo: ApiInfo
    
    func get(page: Int,
             pageSize: Int,
             onComplete: @escaping Completion) {
   
        let uri = NetworkRequestBuilder
            .manufactures(baseUri: apiInfo.baseUri, apiKey: apiInfo.key, page: page, pageSize: pageSize)
            .build()
        service.request(uri) { (response) in
            let info =  self.parse(json: response.json)
            let list = info.json?.dictionary?.compactMap({ (key, value) -> CarManufacture? in
                guard let value = value.string else { return  nil }
                return CarManufacture([key: value])
            })
            
            DispatchQueue.main.async {
                onComplete(list, info.pageInfo, response)
            }

        }
    }
}
