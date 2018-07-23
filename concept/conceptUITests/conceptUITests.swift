//
//  conceptUITests.swift
//  conceptUITests
//
//  Created by Kabir Khan on 23.07.18.
//  Copyright © 2018 Kabir Khan. All rights reserved.
//

import XCTest

class conceptUITests: XCTestCase, UITestScenario {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShowAlert() {
        let app = XCUIApplication()
        scenario( "open Alert", given: "I have a list of manufactures", givenHandler: {

        }, when: "When I select cell open details ", whenHandler: {
            let mainViewCell = app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Brilliance"]/*[[".cells.staticTexts[\"Brilliance\"]",".staticTexts[\"Brilliance\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
            self.waitforExistence(mainViewCell)
            mainViewCell.tap()

            let detailCell = app.tables.cells.containing(.staticText, identifier:"BS6").children(matching: .staticText).matching(identifier: "BS6").element(boundBy: 1)
            self.waitforExistence(detailCell)
            detailCell.tap()
        }, then: "the show alert", thenHandler: {

            let alert = app.alerts["Concept"]
            self.waitforExistence(alert)
            let alertText = alert.staticTexts["Brilliance, BS6"]
            self.waitforExistence(alertText)
            XCTAssertTrue(alertText.exists)
            
            let okButton = alert.buttons["ok"]
            self.waitforExistence(okButton)
            XCTAssertTrue(okButton.exists)
        })
    }
}
