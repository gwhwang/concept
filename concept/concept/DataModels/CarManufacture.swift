//
//  CarManufacture.swift
//  Concept
//
//  Created by Kabir Khan on 17.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

struct CarManufacture: DictionaryModel {
    
    let identifier: String
    let name: String
    
    init?(_ info: [String: String]?) {
        guard let info = CarManufacture.getInfo(from: info) else {
            return nil
        }
        self.identifier = info.key
        self.name = info.value
    }
}
