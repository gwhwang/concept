//
//  AppComponents.swift
//  Concept
//
//  Created by Kabir Khan on 22.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

protocol AppComponentsAdapter {
    
    var appConfiguration: AppConfigurationAdapter { get }
    var networkService: NetworkServiceProvider { get }
}

struct AppComponents: AppComponentsAdapter {
   
    let networkService: NetworkServiceProvider = NetworkService()
    let appConfiguration: AppConfigurationAdapter = AppConfiguration()
    
}
