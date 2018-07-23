//
//  CarsModelViewModel.swift
//  Concept
//
//  Created by Kabir Khan on 20.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

class CarsModelViewModel: StateObservarable {
    
    typealias Element = CarModelCellViewModel
    typealias State = [CarModelCellViewModel]
    
    var list: [CarModelCellViewModel] = []
    var repository: CarModelRespositoryAdapter
    var onChange: ((ViewState<[CarModelCellViewModel]>) -> Void)? = nil
    let carManufacture: CarManufacture
    let title: String
    var state: ViewState<[CarModelCellViewModel]> {
        didSet {
            onChange?(state)
        }
    }
    
    init(carManufacture: CarManufacture, repository: CarModelRespositoryAdapter) {
        self.repository = repository
        self.carManufacture = carManufacture
        self.state = .success([CarModelCellViewModel]())
        self.title = carManufacture.identifier
    }
    
    func alertInfo(_ vm: CarModelCellViewModel?) -> (title: String, message: String) {
        let title = LocalizedString("concept")
        guard let vm = vm else {
            return (title, "")
        }
        let message = "\(carManufacture.name)\(vm.text)"
        return (title, message)
    }
}

// MARK: TableViewDataSourceViewModel

extension CarsModelViewModel: TableViewDataSourceViewModel {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return list.count
    }
    
    func object(at indexPath: IndexPath) -> CarModelCellViewModel? {
        guard indexPath.row < list.count else {
            return nil
        }
        return list[indexPath.row]
    }
    
}


// MARK: Requestable

extension CarsModelViewModel: Requestable {
    
    func refresh() {
        repository.reset()
        fetch()
    }
    
    func fetch() {
        state = .loading
        repository.get(for: carManufacture.identifier) { [weak self] (list, response) in
            if response.result == .success {
                let viewModels = list.enumerated().compactMap({ (index, carModel) -> CarModelCellViewModel? in
                    let theme: Theme = index%2 == 0 ? .dark : .light
                    return CarModelCellViewModel(carModel: carModel, theme: theme)
                })
                self?.list = viewModels
                self?.state = .success(viewModels)
            }
            else if let error = response.error {
                self?.state = .error(error)
            }
            else {
                self?.state = .success([CarModelCellViewModel]())
            }
        }
    }
    
    func canLoadMore(from indexPath: IndexPath) -> Bool {
       return indexPath.row == list.count - 1
    }
}
