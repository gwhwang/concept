//
//  CarManufactureRepository.swift
//  Concept
//
//  Created by Kabir Khan on 20.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

protocol CarManufactureRepositoryAdapter: PageRepository, PageUseCase, Resetable  {
    
    typealias Completion = ([CarManufacture], NetworkDataResponse) -> Void
    func get(onComplete: @escaping Completion)
}

class CarManufactureRepository: CarManufactureRepositoryAdapter {
   
    var list = [CarManufacture]()
    var pageInfo: PageInfo
    let useCase: CarManufactureUseCaseAdapter
    
    init(useCase: CarManufactureUseCaseAdapter, pageInfo: PageInfo) {
        self.useCase = useCase
        self.pageInfo = pageInfo
    }
    
    func reset() {
        self.pageInfo.reset()
        list.removeAll()
    }
    
    func get(onComplete: @escaping Completion) {
        useCase.get(page: pageInfo.page, pageSize: pageInfo.pageSize) { [unowned self] (list, pageInfo, reponse) in
           
            if let list = list, list.count > 0 {
                self.list.append(contentsOf: list)
            }
            if let pageInfo = pageInfo {
                self.pageInfo = pageInfo
            }
            
            onComplete(self.list, reponse)
        }
    }
    
}
