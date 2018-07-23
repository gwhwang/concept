//
//  Theme.swift
//  Concept
//
//  Created by Kabir Khan on 22.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import UIKit

enum Theme {
    
    case dark
    case light
    
    var color: UIColor {
        switch self {
        case .dark:
            return .darkGray
        case .light:
            return .lightGray
        }
    }
}
