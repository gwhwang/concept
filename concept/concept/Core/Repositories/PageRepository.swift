//
//  PageRepository.swift
//  Concept
//
//  Created by Kabir Khan on 20.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

protocol PageRepository {
    
    var pageInfo: PageInfo { get set }
    var canLoadMore: Bool { get }
}

extension PageRepository {
    
    var canLoadMore: Bool {
        return pageInfo.totalPages > pageInfo.page
    }
}
