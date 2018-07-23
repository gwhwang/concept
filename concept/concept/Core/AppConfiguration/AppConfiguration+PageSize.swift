//
//  AppConfiguration+PageSize.swift
//  Concept
//
//  Created by Kabir Khan on 21.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

extension AppConfiguration {
    
    private struct Keys {
        static let pageSize = "pageSize"
    }
    
    var pageSize: Int {
        guard let size = configurations?[Keys.pageSize] as? Int else {
            return 0
        }
        return size
    }
    
}
