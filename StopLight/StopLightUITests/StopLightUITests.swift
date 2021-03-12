//
//  StopLightUITests.swift
//  StopLightUITests
//
//  Created by Sammy Franusic on 9/30/20.
//  Copyright © 2020 sf. All rights reserved.
//

import XCTest

class StopLightUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testBackgrounding() {
        // Launch the application.
        let app = XCUIApplication()
        app.launch()

        let launchExpectation = XCTestExpectation(description: "App should launch after having been placed in the background.")
        let mainView = XCUIApplication().otherElements["mainStopLightView"]

        // Move app to background.
        XCUIDevice.shared.press(.home)

        // Launch app again after some amount of time and then fulfill expectation.
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            app.launch()
            launchExpectation.fulfill()
        }

        // Wait for launch expectation and then check that main view is hittable.
        wait(for: [launchExpectation], timeout: 10)
        XCTAssert(mainView.isHittable)
    }

    func testCloseApplication() {

        let mainView = XCUIApplication().otherElements["mainStopLightView"]
        // Launch the application.
        let app = XCUIApplication()
        app.launch()

        // Close the application.
        app.terminate()

        // Relaunch the application.
        app.activate()
        XCTAssert(mainView.isHittable)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
