//
//  CarManufactureRouter.swift
//  Concept
//
//  Created by Kabir Khan on 22.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import UIKit

protocol CarManufactureRouterAdapter {
    
    func openDetails(_ viewController: CarsManufactureViewController)
    func prepare(for segue: UIStoryboardSegue,
                 viewController: CarsManufactureViewController,
                 sender: Any?)
    
    
}

struct CarManufactureRouter: CarManufactureRouterAdapter {
    
    let carsModelComponents: CarsModelComponentsAdapter!
    
    func openDetails(_ viewController: CarsManufactureViewController) {
        viewController.performSegue(withIdentifier: CarsManufactureViewController.Segue.showDetails, sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue,
                 viewController: CarsManufactureViewController,
                 sender: Any?) {
        
        let destination = segue.destination as! CarsModelViewController
       
        guard let selectedIndex = viewController.tableView?.indexPathForSelectedRow,
            let vm = viewController.viewModel.object(at: selectedIndex) else {
                return
           
        }
        
        destination.viewModel = carsModelComponents.carsModelViewModel(carManufacture: vm.carManufacture)
    }
    
}
