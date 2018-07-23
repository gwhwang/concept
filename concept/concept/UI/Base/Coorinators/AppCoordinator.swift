//
//  AppCoordinator.swift
//  Concept
//
//  Created by Kabir Khan on 22.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    var coordinators = [Coordinator]()
    var navigationController: UINavigationController
    let window: UIWindow
    let factory: ComponentFactoryAdapter
    
    init?(window: UIWindow?, factory: ComponentFactoryAdapter) {
        self.window = window!
        self.factory = factory
        self.navigationController = window!.rootViewController! as! UINavigationController
    }
    
    
    func start() {
        let vc = navigationController.viewControllers.first as? CarsManufactureViewController
        let config = factory.carsManufacture()
        vc?.viewModel = config.viewModel
        vc?.router = config.router
    }
    
}
