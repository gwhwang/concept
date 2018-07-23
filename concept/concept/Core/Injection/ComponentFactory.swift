//
//  ComponentFactory.swift
//  Concept
//
//  Created by Kabir Khan on 22.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

protocol ComponentFactoryAdapter {
    
    func appComponent() -> AppComponentsAdapter
    func carsManufacture() -> (viewModel: CarsManufactureViewModel, router: CarManufactureRouterAdapter)
}

struct ComponentFactory: ComponentFactoryAdapter {
    
    private static var instance: AppComponentsAdapter!
    func appComponent() -> AppComponentsAdapter {
        if ComponentFactory.instance == nil {
            ComponentFactory.instance = AppComponents()
        }
        return ComponentFactory.instance
    }
    
    private var networkService: NetworkServiceProvider {
        return appComponent().networkService
    }
    private var appConfig: AppConfigurationAdapter {
        return appComponent().appConfiguration
    }
    private var apiInfo: ApiInfo {
        return appConfig.apiInfo
    }
    private var pageSize: Int {
        return appConfig.pageSize
    }
    
    func carsManufacture() -> (viewModel: CarsManufactureViewModel, router: CarManufactureRouterAdapter) {
        let manufactureComponents = CarManufactureComponents()
        let viewModel = manufactureComponents.carManufactureViewModel(networkService: networkService,
                                                                                   apiInfo: apiInfo,
                                                                                   pageSize: pageSize)
        let modelCompents = CarsModelComponents(networkService: networkService,
                                                apiInfo: apiInfo,
                                                pageSize: pageSize)
        
        let router = manufactureComponents.router(carsModelComponents: modelCompents)
        
        return (viewModel, router)
    }

}


// MARK:- Current static instance

extension ComponentFactory {
    
    static let current = ComponentFactory()
}

