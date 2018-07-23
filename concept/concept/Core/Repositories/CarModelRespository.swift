//
//  CarModelRespository.swift
//  Concept
//
//  Created by Kabir Khan on 20.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

protocol CarModelRespositoryAdapter: PageRepository, Resetable  {
    
    typealias Completion = ([CarModel], NetworkDataResponse) -> Void
    func get(for manufacturerId: String,
             onComplete: @escaping Completion)
}


class CarModelRespository: CarModelRespositoryAdapter {

    var list = [CarModel]()
    var pageInfo: PageInfo
    let useCase: CarModelUseCaseAdapter
    
    init(useCase: CarModelUseCaseAdapter, pageInfo: PageInfo) {
        self.useCase = useCase
        self.pageInfo = pageInfo
    }
    
    func reset() {
        self.pageInfo.reset()
        list.removeAll()
    }

    
    func get(for manufacturerId: String,
             onComplete: @escaping Completion) {
        useCase.get(mufactureId: manufacturerId, page: pageInfo.page, pageSize: pageInfo.pageSize) { [weak self] (list, pageInfo, reponse) in
        
            if let list = list, list.count > 0 {
                self?.list.append(contentsOf: list)
            }
            if let pageInfo = pageInfo {
                self?.pageInfo = pageInfo
            }
            
            onComplete(self?.list ?? [], reponse)
        }
    }
    
}
