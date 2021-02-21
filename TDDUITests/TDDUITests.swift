//
//  TDDUITests.swift
//  TDDUITests
//
//  Created by admin on 19.02.2021.
//

import XCTest

class TDDUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
         app = XCUIApplication()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testButtonIsDiabled() throws {
        app.activate()
     
        XCTAssertFalse(app/*@START_MENU_TOKEN@*/.buttons["Log In"].staticTexts["Log In"]/*[[".buttons[\"Log In\"].staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.isAccessibilityElement)

        app.terminate()
    }
    
    func testWhenEmailIsIncorect() {
        app.activate()
        
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText("qwerty")
        
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText("qwerty1A")
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Log In"]/*[[".buttons[\"Log In\"].staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.alerts["Incorect email"].isEnabled)
        app.alerts["Incorect email"].scrollViews.otherElements.buttons["Cancel"].tap()
        app.terminate()
    }
    
    func testWhenPasswordIncorect() {
        app.activate()
        
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText("qwerty@gmail.com")
        
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText("qwer")
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Log In"]/*[[".buttons[\"Log In\"].staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.alerts["Incorect password"].isEnabled)
        app.alerts["Incorect password"].scrollViews.otherElements.buttons["Cancel"].tap()
        app.terminate()
    }
    
    func testWellGood() {
        app.activate()
        app.textFields["Email"].tap()

        app.textFields["Email"].typeText("qwerty@gmail.com")


        app.secureTextFields["Password"].tap()

        app.secureTextFields["Password"].typeText("qwerty1Q")

        app/*@START_MENU_TOKEN@*/.buttons["Log In"].staticTexts["Log In"]/*[[".buttons[\"Log In\"].staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssertTrue(app.children(matching: .window).element(boundBy: 0).exists)
        
        app.children(matching: .window).element(boundBy: 0).swipeDown()
        app.terminate()
}
 
}
