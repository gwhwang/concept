//
//  CarsManufactureCellViewModel.swift
//  Concept
//
//  Created by Kabir Khan on 20.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import UIKit

struct CarsManufactureCellViewModel: CellViewModel {
    
    let carManufacture: CarManufacture
    let theme: Theme
    
    var text: String {
        return carManufacture.name
    }
    var detailText: String {
        return carManufacture.identifier
    }
 
}
