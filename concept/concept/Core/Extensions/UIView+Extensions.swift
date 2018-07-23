//
//  UIView+Extensions.swift
//  Concept
//
//  Created by Kabir Khan on 21.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    static var reuseIdentifier: String {
        let nameSpaceClassName = NSStringFromClass(self)
        guard let className = nameSpaceClassName.components(separatedBy: ".").last else {
            return nameSpaceClassName
        }
        return className
    }
    
    
    class func newFromNib() -> UIView? {
        guard let view = Bundle.main.loadNibNamed(self.reuseIdentifier, owner: nil, options: nil)?.first as? UIView else {
            // xib not loaded, or it's top view is of the wrong type
            return nil
        }
        return view
    }
    
    class func nib() -> UINib {
        return UINib(nibName: self.reuseIdentifier, bundle: nil)
    }
}
