//
//  TestScenario.swift
//  FoodoraTests
//
//  Created by Kabir Khan on 01.06.18.
//  Copyright © 2018 Foodora. All rights reserved.
//

import Foundation
import XCTest

protocol TestScenario {
    
    func scenario(_ name: String?,
                  given: String?,
                  givenHandler:  @escaping () -> Void,
                  when: String?,
                  whenHandler:  @escaping () -> Void,
                  then: String?,
                  thenHandler: @escaping () -> Void)
}

extension TestScenario where Self: XCTestCase {

    func scenario(_ name: String?,
                  given: String?,
                  givenHandler:  @escaping () -> Void,
                  when: String?,
                  whenHandler:  @escaping () -> Void,
                  then: String?,
                  thenHandler: @escaping () -> Void) {
        
        print("Scenario: \(name ?? "")")
        print("Given: \(given ?? "")")
        givenHandler()
        print("When: \(when ?? "")")
        whenHandler()
        print("Then: \(then ?? "")")
        thenHandler()
    }
    
    func scenario(_ name: String?,
                  given: String?,
                  givenHandler:  @escaping () -> Void,
                  when: String?,
                  whenHandler:  @escaping () -> Void,
                  then: String?,
                  thenHandler: @escaping () -> Void,
                  and: String? = nil,
                  andHandler: @escaping () -> Void) {
        
        print("Scenario: \(name ?? "")")
        print("Given: \(given ?? "")")
        givenHandler()
        print("When: \(when ?? "")")
        whenHandler()
        print("Then: \(then ?? "")")
        thenHandler()
        print("And:\(and ?? "")")
        andHandler()
    }
}
