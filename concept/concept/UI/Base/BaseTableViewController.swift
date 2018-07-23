//
//  BaseTableViewController.swift
//  Concept
//
//  Created by Kabir Khan on 21.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = estimatedRowHeight
        
        refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        if #available(iOS 10.0, *) {
            tableView?.refreshControl = refreshControl
        } else {
            tableView?.addSubview(refreshControl)
        }
    }
    
    @objc func refresh() {
        
    }
}

// MARK: TableViewDecorator

extension BaseTableViewController: TableViewDecorator {
    
}

// MARK: RefreshableView

extension BaseTableViewController: RefreshableView {
 
    func startRefershing() {
       navigationItem.rightBarButtonItem = refershButton
    }
    
    func stopRefreshing() {
        refreshControl.endRefreshing()
        navigationItem.rightBarButtonItem = nil
    }

}
