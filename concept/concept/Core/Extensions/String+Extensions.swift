//
//  String+Extensions.swift
//  Concept
//
//  Created by Kabir Khan on 18.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

func LocalizedString(_ key: String) -> String {
    return NSLocalizedString(key, comment: key)
}
