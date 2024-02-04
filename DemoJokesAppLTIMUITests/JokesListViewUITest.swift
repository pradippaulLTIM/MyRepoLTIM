//
//  JokesListViewUITest.swift
//  DemoJokesAppLTIMTests
//
//  Created by 61092893 on 31/01/24.
//

import XCTest
@testable import DemoJokesAppLTIM

final class JokesListUITest: XCTestCase {
    private var app: XCUIApplication!


    override func setUpWithError() throws {
        app = XCUIApplication() // Initializes the XCTest app
        app.launch() // Launches the app
    }

    override func tearDownWithError() throws {
        app = nil //Makes sure that the test wont have residual values, it will be torn down each time the funcion has finished
    }

    func testTitle() throws {
        // Use the XCUIElementQuery to locate the title Text
        let suggestedTitleText = app.staticTexts["Jokes"]
        
        // Check if the title text is visible
        XCTAssertTrue(suggestedTitleText.exists)
    }

}
