//
//  CarsModelComponents.swift
//  Concept
//
//  Created by Kabir Khan on 22.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

protocol CarsModelComponentsAdapter {
    
    func carsModelViewModel(carManufacture: CarManufacture) -> CarsModelViewModel
}

struct CarsModelComponents: CarsModelComponentsAdapter {
    
    let networkService: NetworkServiceProvider
    let apiInfo: ApiInfo
    let pageSize: Int
    
    func carsModelViewModel(carManufacture: CarManufacture) -> CarsModelViewModel {
        let pageInfo = PageInfo(page: 0, pageSize: pageSize, totalPages: pageSize)
        let useCase = CarModelUseCase(service: networkService, apiInfo: apiInfo)
        let repository = CarModelRespository(useCase: useCase, pageInfo: pageInfo)
        
        return CarsModelViewModel(carManufacture: carManufacture, repository: repository)
    }
}
