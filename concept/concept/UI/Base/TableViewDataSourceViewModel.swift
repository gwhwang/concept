//
//  TableViewDataSourceViewModel.swift
//  Concept
//
//  Created by Kabir Khan on 17.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation


protocol TableViewDataSourceViewModel {
    
    associatedtype Element
    var list: [Element] { get set }
    
    func numberOfSections() -> Int
    
    func numberOfRows(in section: Int) -> Int
    
    func object(at indexPath: IndexPath) -> Element?
    
    // MARK: For section view
    
    func title(for section: Int) -> String
}

extension TableViewDataSourceViewModel {
    
    func title(for section: Int) -> String {
        return ""
    }
}
