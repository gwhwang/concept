//
//  Page.swift
//  Concept
//
//  Created by Kabir Khan on 21.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

struct PageInfo: Resetable {

    var page: Int
    let pageSize: Int
    let totalPages: Int
    
    mutating func reset() {
        page = 0
    }
    
}
