//
//  Coorinator.swift
//  Concept
//
//  Created by Kabir Khan on 22.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: class {
    
    var coordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
