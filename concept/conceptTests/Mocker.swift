//
//  Mocker.swift
//  conceptTests
//
//  Created by Kabir Khan on 24.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
@testable import concept

class Mocker {
    
    static func carManufactureRepository(stub: StubType) -> CarManufactureRepository {
        let pageSize = 15
        let pageInfo = PageInfo(page: 0, pageSize: pageSize, totalPages: 0)
        let apiInfo = ApiInfo(key: "", baseUri: "")
        let service = NetworkServiceStub(stub: stub)
        let useCase = CarManufactureUseCase(service: service, apiInfo: apiInfo)
        return CarManufactureRepository(useCase: useCase, pageInfo: pageInfo)
    }
    
    static func carsManufactureViewModel(stub: StubType) -> CarsManufactureViewModel {
       return CarsManufactureViewModel(repository: carManufactureRepository(stub: stub))
    }
    
    static func carModelRespository(stub: StubType) -> CarModelRespository {
        let pageSize = 15
        let pageInfo = PageInfo(page: 0, pageSize: pageSize, totalPages: 0)
        let apiInfo = ApiInfo(key: "", baseUri: "")
        let service = NetworkServiceStub(stub: stub)
        let useCase = CarModelUseCase(service: service, apiInfo: apiInfo)
        return CarModelRespository(useCase: useCase, pageInfo: pageInfo)
    }
    
    static func carsModelViewModel(stub: StubType, carManufacture: CarManufacture) -> CarsModelViewModel {
        return CarsModelViewModel(carManufacture: carManufacture, repository: carModelRespository(stub: stub))
    }
}
