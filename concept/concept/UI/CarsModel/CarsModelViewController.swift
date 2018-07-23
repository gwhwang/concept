//
//  CarsModelViewController.swift
//  Concept
//
//  Created by Kabir Khan on 21.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import UIKit

class CarsModelViewController: BaseTableViewController {
    
    var viewModel: CarsModelViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }
    
    override func configure() {
        super.configure()
        self.title = viewModel.title
        
        tableView?.register(CarsModelTableViewCell.nib(), forCellReuseIdentifier: CarsModelTableViewCell.reuseIdentifier)
        tableView?.dataSource = self
        tableView?.delegate = self
        
        bind()
    }
    
    @objc override func refresh() {
        viewModel.refresh()
    }
    
}

// MARK: Bindable

extension CarsModelViewController: Bindable {
  
    func bind() {
        viewModel.onChange = { [weak self] state in
            switch state {
            case .loading:
                self?.startRefershing()
            case.success(_):
                self?.stopRefreshing()
                self?.tableView?.reloadData()
            case .error(let error):
                self?.stopRefreshing()
                self?.showAlert(title: error.title, message: error.description)
            }
        }
    }
}

// MARK: TableViewDataSouce

extension CarsModelViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarsModelTableViewCell.reuseIdentifier) as! CarsModelTableViewCell
        cell.viewModel = viewModel.object(at: indexPath)
        
        if viewModel.canLoadMore(from: indexPath) {
            viewModel.fetch()
        }
        return cell
    }

}


// MARK: UITableViewDelegate

extension CarsModelViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let vm = viewModel.object(at: indexPath) {
            cell.backgroundColor = vm.theme.color
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let info = viewModel.alertInfo(viewModel.object(at: indexPath))
        showAlert(title: info.title, message: info.message)
    }
}
