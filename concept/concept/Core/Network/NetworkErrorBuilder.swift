//
//  NetworkErrorBuilder.swift
//  Concept
//
//  Created by Kabir Khan on 18.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import SwiftyJSON

struct NetworkErrorBuilder {
    
    static func build(from response: JSON?, error: Error?) -> NetworkError? {
        let title = LocalizedString("error")
        guard let error = error else {
            return nil
        }
      
        return NetworkError(title: title, description: error.localizedDescription, error: error)
    }
}
