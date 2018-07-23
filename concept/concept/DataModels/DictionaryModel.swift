//
//  DictionaryModel.swift
//  Concept
//
//  Created by Kabir Khan on 18.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

protocol DictionaryModel {
    
}

extension DictionaryModel {
    
    static func getInfo<K, V>(from info: [K: V]?) -> (key: K, value: V)? {
        guard let info = info,
        let key =  info.keys.first,
        let value = info[key] else {
            return nil
        }
 
        return (key, value)
    }
    
}
