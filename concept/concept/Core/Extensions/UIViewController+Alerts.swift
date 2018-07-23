//
//  UIViewController+Alerts.swift
//  Concept
//
//  Created by Kabir Khan on 21.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String?, message: String?, delay: Bool, handler: ((UIAlertAction) -> Void)? = nil) {
        let delayInSec: TimeInterval = delay ? 0.05: 0
        let deadline: DispatchTime = .now() + delayInSec
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            self.showAlert(title: title, message: message, handler: handler)
        })
    }
    
    @discardableResult
    func showAlert(title: String?, message: String?, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let okActionInfo: [UIAlertActionStyle: String] = [.default : LocalizedString("ok")]
        let cancelActionInfo: [UIAlertActionStyle: String] = [.cancel : LocalizedString("cancel")]
        
        let actions = handler == nil ?  [okActionInfo] : [okActionInfo, cancelActionInfo]
        
        return self.showAlert(title: title, message: message, options: actions, preferredStyle: .alert, handler: handler)
        
    }
    
    // MARK: Alert
    
    @discardableResult
    func showAlert(title: String?, message: String?, options: [[UIAlertActionStyle: String]], preferredStyle: UIAlertControllerStyle, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: preferredStyle)
        
        for option in options {
            for (key, action) in option {
                let alertAction = UIAlertAction(title: action, style: key, handler: handler)
                alertController.addAction(alertAction)
            }
        }
        
        self.present(alertController, animated: true)
        return alertController
    }
}
