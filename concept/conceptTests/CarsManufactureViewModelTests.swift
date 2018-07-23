//
//  CarsManufactureViewModelTests.swift
//  conceptTests
//
//  Created by Kabir Khan on 23.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import XCTest
@testable import concept

class CarsManufactureViewModelTests: XCTestCase, TestScenario {
    
    var viewModel: CarsManufactureViewModel!
    let pageSize = 15
    
    func testTitle() {
        self.viewModel = Mocker.carsManufactureViewModel(stub: .manufacturers_page_0)
        XCTAssertEqual(self.viewModel.title, LocalizedString("manufactures"))
    }
    
    func testRefreshView() {
        let expectation = XCTestExpectation(description: "com.concept.async.tsat")
        scenario("View Model Has Data", given: "", givenHandler: {
            self.viewModel = Mocker.carsManufactureViewModel(stub: .manufacturers_page_0)
        }, when: "User refresh the view", whenHandler: {
            self.viewModel.refresh()
        }, then: "User can have list") {
            self.viewModel.onChange = { state in
                switch state {
                    case .success(_):
                    XCTAssertEqual(self.viewModel.list.count, self.pageSize)
                    XCTAssertEqual(self.viewModel.numberOfSections(), 1)
                    XCTAssertEqual(self.viewModel.numberOfRows(in: 0), self.pageSize)
                default: break
                }
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    func testCarsManufactureCellViewModelDarkTheme() {
        let expectation = XCTestExpectation(description: "com.concept.async.tsat")
        scenario("Cell View", given: "", givenHandler: {
            self.viewModel = Mocker.carsManufactureViewModel(stub: .manufacturers_page_0)
        }, when: "User refresh the view", whenHandler: {
            self.viewModel.refresh()
        }, then: "User can have list") {
            self.viewModel.onChange = { state in
                switch state {
                case .success(_):
                    let indexPath = IndexPath(item: 0, section: 0)
                    let vm = self.viewModel.object(at: indexPath)
                    XCTAssertEqual(vm?.text, "Alpina")
                    XCTAssertEqual(vm?.detailText, "042")
                    XCTAssertEqual(vm?.theme, Theme.dark)
                default: break
                }
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testCarsManufactureCellViewModelLightTheme() {
        let expectation = XCTestExpectation(description: "com.concept.async.tsat")
        scenario("Cell View", given: "", givenHandler: {
            self.viewModel = Mocker.carsManufactureViewModel(stub: .manufacturers_page_0)
        }, when: "User refresh the view", whenHandler: {
            self.viewModel.refresh()
        }, then: "User can have list") {
            self.viewModel.onChange = { state in
                switch state {
                case .success(_):
                    let indexPath = IndexPath(item: 1, section: 0)
                    let vm = self.viewModel.object(at: indexPath)
                    XCTAssertEqual(vm?.text, "Alfa Romeo")
                    XCTAssertEqual(vm?.detailText, "040")
                    XCTAssertEqual(vm?.theme, Theme.light)
                default: break
                }
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
}
