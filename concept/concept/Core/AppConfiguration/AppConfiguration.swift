//
//  AppConfiguration.swift
//  Concept
//
//  Created by Kabir Khan on 20.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

protocol AppConfigurationAdapter {
    
    var apiInfo: ApiInfo { get }
    var pageSize: Int { get }
}

struct AppConfiguration: AppConfigurationAdapter {
    
    var configurations: [AnyHashable: Any]?
    
    private struct Keys {
        static let fileName = "AppConfiguration"
        static let fileExtension = "plist"
    }
    
    init() {
        let fileName = Keys.fileName
        let fileExtension = Keys.fileExtension
        
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: fileExtension),
            let configurations = NSDictionary(contentsOfFile: filePath) as? [AnyHashable: Any] else {
                return
        }
        self.configurations = configurations
    }
}
