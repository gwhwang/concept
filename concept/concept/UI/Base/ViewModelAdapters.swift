//
//  ViewModelAdapters.swift
//  Concept
//
//  Created by Kabir Khan on 21.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation

// MARK: ViewState

enum ViewState<T> {
    
    case loading
    case success(T)
    case error(NetworkError)
}

// MARK: Requestable

protocol Requestable {
    
    func refresh()
    func fetch()
    
}

// MARK: PageLoader

protocol PageLoader {

    func canLoadMore(from index: IndexPath) -> Bool
}


// MARK: Requestable

protocol StateObservarable {
    
    associatedtype State
    var state: ViewState<State> { get set }
    var onChange: ((ViewState<State>) -> Void)? { get set }
}
