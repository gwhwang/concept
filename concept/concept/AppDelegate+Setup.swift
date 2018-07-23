//
//  AppDelegate+Setup.swift
//  Concept
//
//  Created by Kabir Khan on 22.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

extension AppDelegate {
    
    static var coordinator: AppCoordinator!
    
    func setup() {
        AppDelegate.coordinator = AppCoordinator(window: window,
                                                factory: ComponentFactory.current)
        AppDelegate.coordinator?.start()
    }
}
