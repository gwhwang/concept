//
//  CarModelUseCase.swift
//  Concept
//
//  Created by Kabir Khan on 20.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

protocol CarModelUseCaseAdapter {
   
    typealias Completion = ([CarModel]?, PageInfo?, NetworkDataResponse) -> Void
    
    func get(mufactureId: String,
             page: Int,
             pageSize: Int,
             onComplete: @escaping Completion)
}

struct CarModelUseCase: CarModelUseCaseAdapter, PageUseCase {
    
    let service: NetworkServiceProvider
    let apiInfo: ApiInfo
    
    func get(mufactureId: String,
             page: Int,
             pageSize: Int,
             onComplete: @escaping Completion) {
        let uri = NetworkRequestBuilder
            .models(baseUri: apiInfo.baseUri, apiKey: apiInfo.key, mufactureId: mufactureId, page: page, pageSize: pageSize)
            .build()
        service.request(uri) { (response) in
            let info =  self.parse(json: response.json)
            let list = info.json?.dictionary?.compactMap({ (key, value) -> CarModel? in
                guard let value = value.string else { return  nil }
                return CarModel([key: value])
            })
            
            DispatchQueue.main.async {
                onComplete(list, info.pageInfo, response)
            }

        }
    }
}
