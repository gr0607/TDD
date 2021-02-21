//
//  TDDTests.swift
//  TDDTests
//
//  Created by admin on 19.02.2021.
//

import XCTest
@testable import TDD

class TDDTests: XCTestCase {
    
    var sut: Validator!
    
    override func setUpWithError() throws {
       sut = Validator()
    }

    override func tearDownWithError() throws {
       sut = nil
    }
    
    func testWhenEmailIsValid() {
        XCTAssertEqual(sut.isEmailValid(K.validEmail), true)
    }
    
    func testWhenEmailIsInvalid() {
        XCTAssertEqual(sut.isEmailValid(K.invalidEmail), false)
    }
    
    func testWhenEmailIsInvalidTwo() {
        XCTAssertEqual(sut.isEmailValid(K.invalidPostfixEmail), false)
    }
    
    func testWhenEmailIsInvalidThree() {
        XCTAssertEqual(sut.isEmailValid(K.invalidPostfixEmailDot), false)
    }
    
    func testWhenEmailIsInvalidFour() {
        XCTAssertEqual(sut.isEmailValid(K.invalidPostfixEmailCom), false)
    }
    
    func testWhenEmailIsInvalidFive() {
        XCTAssertEqual(sut.isEmailValid(K.invalidPrefixEmail), false)
    }
    
    func testWhenPasswordValid() {
        XCTAssertEqual(sut.isPasswordValid(K.validPass), true)
    }
    
    func testWhenPasswordInvalidWithLow() {
        XCTAssertEqual(sut.isPasswordValid(K.invalidPassLow), false)
    }
    
    func testWhenPasswordInvalidWithOutCapitalLetter() {
        XCTAssertEqual(sut.isPasswordValid(K.invalidPassCapital), false)
    }
    
    func testWhenPasswordInvalidWithOutDigit() {
        XCTAssertEqual(sut.isPasswordValid(K.invalidPassNumber), false)
    }
}
