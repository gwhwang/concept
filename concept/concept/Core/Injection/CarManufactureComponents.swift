//
//  CarManufactureComponents.swift
//  Concept
//
//  Created by Kabir Khan on 22.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

protocol CarManufactureComponentsAdapter {
    
    func carManufactureViewModel(networkService: NetworkServiceProvider,
                                 apiInfo: ApiInfo,
                                 pageSize: Int) -> CarsManufactureViewModel
    
    func router(carsModelComponents: CarsModelComponentsAdapter) -> CarManufactureRouterAdapter
    
}

struct CarManufactureComponents: CarManufactureComponentsAdapter {

   func carManufactureViewModel(networkService: NetworkServiceProvider,
                                apiInfo: ApiInfo,
                                pageSize: Int) -> CarsManufactureViewModel {
        let pageInfo = PageInfo(page: 0, pageSize: pageSize, totalPages: 0)
        
        let useCase = CarManufactureUseCase(service: networkService, apiInfo: apiInfo)
        let repository = CarManufactureRepository(useCase: useCase, pageInfo: pageInfo)
        
        return CarsManufactureViewModel(repository: repository)
    }
    
    func router(carsModelComponents: CarsModelComponentsAdapter) -> CarManufactureRouterAdapter {
       return CarManufactureRouter(carsModelComponents: carsModelComponents)
    }
}
