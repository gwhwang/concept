//
//  CarsModelViewModelTests.swift
//  conceptTests
//
//  Created by Kabir Khan on 23.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import Foundation
import XCTest
@testable import concept

class CarsModelViewModelTests: XCTestCase, TestScenario {
    
    var viewModel: CarsModelViewModel!
    let carManufacture = CarManufacture(["107": "Bentley"])
    
    private func setup(stub: StubType) {
        viewModel = Mocker.carsModelViewModel(stub: stub, carManufacture: carManufacture!)
    }
    
    func testTitle() {
        self.setup(stub: .model_manufacturer_107_page_0)
        XCTAssertEqual(self.viewModel.title, carManufacture?.name)
    }
    
    func testRefreshView() {
        let expectation = XCTestExpectation(description: "com.concept.async.tsat")
        scenario("View Model Has Data", given: "", givenHandler: {
            self.setup(stub: .model_manufacturer_107_page_0)
        }, when: "User refresh the view", whenHandler: {
            self.viewModel.refresh()
        }, then: "User can have list") {
            self.viewModel.onChange = { state in
                switch state {
                case .success(_):
                    XCTAssertEqual(self.viewModel.list.count, 6)
                    XCTAssertEqual(self.viewModel.numberOfSections(), 1)
                    XCTAssertEqual(self.viewModel.numberOfRows(in: 0), 6)
                default: break
                }
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    func testCarsModeleCellViewModelDarkTheme() {
        let expectation = XCTestExpectation(description: "com.concept.async.tsat")
        scenario("Cell View", given: "", givenHandler: {
            self.setup(stub: .model_manufacturer_107_page_0)
        }, when: "User refresh the view", whenHandler: {
            self.viewModel.refresh()
        }, then: "User can have list") {
            self.viewModel.onChange = { state in
                switch state {
                case .success(_):
                    let indexPath = IndexPath(item: 0, section: 0)
                    let vm = self.viewModel.object(at: indexPath)
                    XCTAssertEqual(vm?.text, "Arnage")
                    XCTAssertEqual(vm?.detailText, "Arnage")
                    XCTAssertEqual(vm?.theme, Theme.dark)
                default: break
                }
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testCarsModeleCellViewModelLightTheme() {
        let expectation = XCTestExpectation(description: "com.concept.async.tsat")
        scenario("Cell View", given: "", givenHandler: {
            self.setup(stub: .model_manufacturer_107_page_0)
        }, when: "User refresh the view", whenHandler: {
            self.viewModel.refresh()
        }, then: "User can have list") {
            self.viewModel.onChange = { state in
                switch state {
                case .success(_):
                    let indexPath = IndexPath(item: 1, section: 0)
                    let vm = self.viewModel.object(at: indexPath)
                    XCTAssertEqual(vm?.text, "Continental GT")
                    XCTAssertEqual(vm?.detailText, "Continental GT")
                    XCTAssertEqual(vm?.theme, Theme.light)
                default: break
                }
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    func testAlertInfo() {
        let expectation = XCTestExpectation(description: "com.concept.async.tsat")
        scenario("Cell View", given: "", givenHandler: {
            self.setup(stub: .model_manufacturer_107_page_0)
        }, when: "User refresh the view & when use tap on item", whenHandler: {
            self.viewModel.refresh()
        }, then: "show list") {
            self.viewModel.onChange = { state in
                switch state {
                case .success(_):
                    let indexPath = IndexPath(item: 1, section: 0)
                    let vm = self.viewModel.object(at: indexPath)
                    
                    let alertInfo = self.viewModel.alertInfo(vm)
                    XCTAssertEqual(alertInfo.title, LocalizedString("concept"))
                    XCTAssertEqual(alertInfo.message, "Bentley, Continental GT")
                default: break
                }
                expectation.fulfill()
            }
            
        }
        wait(for: [expectation], timeout: 10.0)
    }

}
