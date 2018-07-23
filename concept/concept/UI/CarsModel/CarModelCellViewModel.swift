//
//  CarsManufactureCellViewModel.swift
//  Concept
//
//  Created by Kabir Khan on 20.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import UIKit

struct CarModelCellViewModel: CellViewModel {

    let carModel: CarModel
    let theme: Theme
    
    var text: String {
        return carModel.name
    }
    var detailText: String {
        return carModel.identifier
    }
    
}
