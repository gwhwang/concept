//
//  CarsManufacturerViewModel.swift
//  Concept
//
//  Created by Kabir Khan on 17.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

class CarsManufactureViewModel: StateObservarable {
    
    typealias Element = CarsManufactureCellViewModel
    typealias State = [CarsManufactureCellViewModel]
    
    var list: [CarsManufactureCellViewModel] = []
    var repository: CarManufactureRepositoryAdapter
    var onChange: ((ViewState<[CarsManufactureCellViewModel]>) -> Void)? = nil
    var state: ViewState<[CarsManufactureCellViewModel]> {
        didSet {
            onChange?(state)
        }
    }
    var title: String {
        return LocalizedString("manufactures")
    }
    
    init(repository: CarManufactureRepositoryAdapter) {
        self.repository = repository
        self.state = .success([CarsManufactureCellViewModel]())
    }
}


// MARK: TableViewDataSourceViewModel

extension CarsManufactureViewModel: TableViewDataSourceViewModel {
   
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return list.count
    }
    
    func object(at indexPath: IndexPath) -> CarsManufactureCellViewModel? {
        guard indexPath.row < list.count else {
            return nil
        }
        return list[indexPath.row]
    }
    
}

// MARK: Requestable

extension CarsManufactureViewModel: Requestable {
    
    func refresh() {
        repository.reset()
        fetch()
    }
    
    func fetch() {
        state = .loading
        repository.get { [weak self] (list, response) in
            if response.result == .success {
                let viewModels = list.enumerated().compactMap({ (index, carManufacture) -> CarsManufactureCellViewModel? in
                    let theme: Theme = index%2 == 0 ? .dark : .light
                    return CarsManufactureCellViewModel(carManufacture: carManufacture, theme: theme)
                })
                self?.list = viewModels
                self?.state = .success(viewModels)
            }
            else if let error = response.error {
                self?.state = .error(error)
            }
            else {
                self?.state = .success([CarsManufactureCellViewModel]())
            }
        }
    }
    
    func canLoadMore(from indexPath: IndexPath) -> Bool {
        return indexPath.row == list.count - 1 && repository.canLoadMore
    }
    
}
