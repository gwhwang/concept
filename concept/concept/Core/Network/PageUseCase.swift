//
//  PageParser.swift
//  Concept
//
//  Created by Kabir Khan on 21.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol PageUseCase {
    
}
extension PageUseCase {
    
    func parse(json: JSON?) -> (pageInfo:PageInfo, json: JSON?) {
        var page = json?["page"].intValue ?? 0
        let pageSize = json?["pageSize"].intValue ?? 0
        let totalPages = json?["totalPages"].intValue ?? 0
        let json = json?["wkda"]
        
        page = totalPages > page ? page + 1 : page
        
        let pageInfo = PageInfo(page: page, pageSize: pageSize, totalPages: totalPages)
        
        return (pageInfo, json)
    }
}
