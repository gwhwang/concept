//
//  CarsManufacturerViewController.swift
//  Concept
//
//  Created by Kabir Khan on 21.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import UIKit

class CarsManufactureViewController: BaseTableViewController {

    var viewModel: CarsManufactureViewModel!
    var router: CarManufactureRouterAdapter!
   
    struct Segue {
        static let showDetails = "showDetails"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView?.indexPathForSelectedRow {
            tableView?.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func configure() {
        super.configure()
        self.title = viewModel.title
      
        tableView?.register(CarsManufactureTableViewCell.nib(), forCellReuseIdentifier: CarsManufactureTableViewCell.reuseIdentifier)
        tableView?.dataSource = self
        tableView?.delegate = self

        bind()
    }

    @objc override func refresh() {
        viewModel.refresh()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, viewController: self, sender: sender)
    }
}

// MARK: Bindable

extension CarsManufactureViewController: Bindable {
 
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

extension CarsManufactureViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarsManufactureTableViewCell.reuseIdentifier) as! CarsManufactureTableViewCell
        cell.viewModel = viewModel.object(at: indexPath)
        
        if viewModel.canLoadMore(from: indexPath) {
            viewModel.fetch()
        }
        return cell
    }


}

// MARK: UITableViewDelegate

extension CarsManufactureViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let vm = viewModel.object(at: indexPath) {
            cell.backgroundColor = vm.theme.color
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.openDetails(self)
    }
}

