//
//  CarsManufactureTableViewCell.swift
//  Concept
//
//  Created by Kabir Khan on 22.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import UIKit

class CarsManufactureTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var viewModel: CellViewModel? {
        didSet {
            titleLabel.text = viewModel?.text
            detailLabel.text = viewModel?.detailText
        }
    }
}

