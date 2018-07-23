//
//  Bindable.swift
//  Concept
//
//  Created by Kabir Khan on 21.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import UIKit

// MARK: Bindable

protocol Bindable {
    
    func bind()
}

protocol BindableView: Bindable { }

// MARK: Requestable

protocol RefreshableView {
    
    var refershButton: UIBarButtonItem { get }
    var refreshControl: UIRefreshControl { get }
    func startRefershing()
    func stopRefreshing()
    
}

extension RefreshableView {
    
    var refershButton: UIBarButtonItem {
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicatorView.sizeToFit()
        activityIndicatorView.startAnimating()
        return UIBarButtonItem(customView: activityIndicatorView)
    }
}

// MARK: TableViewDecorator

protocol TableViewDecorator {
    
    var estimatedRowHeight: CGFloat { get }
}

extension TableViewDecorator {
    
    var estimatedRowHeight: CGFloat {
        return 50
    }
}
