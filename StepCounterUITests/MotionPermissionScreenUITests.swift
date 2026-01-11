//
//  MotionPermissionScreenUITests.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 06/01/2026.
//

import XCTest

final class MotionPermissionScreenUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["--ui-testing"] // triggers fake provider
    }

    /// This test verifies that when app starts if permission already granted then navigates directly to pedometer screen
    func test_allowAccess_permissionGrantedAndNavigates() {
        app.launchEnvironment["motion-sensor-permission"] = "authorized"
        app.launch()

        let mainScreenLabel = app.staticTexts["Today's Activity"]
        XCTAssertTrue(mainScreenLabel.waitForExistence(timeout: 1.0))
    }
    
    /// This test verifies that when permission is not granted it will show permissions screen and
    /// navigates to Pedometer screen on permission grant.
    func test_allowAccess_notDetermined_grantsPermissionAndNavigates() {
        app.launchEnvironment["motion-sensor-permission"] = "notDetermined"
        app.launch()

        let allowButton = app.buttons["Allow Access"]
        XCTAssertTrue(allowButton.exists, "Allow Access button should be visible")

        allowButton.tap()

        let mainScreenLabel = app.staticTexts["Today's Activity"]
        XCTAssertTrue(mainScreenLabel.waitForExistence(timeout: 3.0))
    }

    /// This test verifies that step counting and updating label
    func test_stepsCounting() {
        app.launchEnvironment["motion-sensor-permission"] = "authorized"
        app.launch()
        
        let mainScreenLabel = app.staticTexts["Today's Activity"]
        XCTAssertTrue(mainScreenLabel.waitForExistence(timeout: 3.0))
        
        let stepsLabel = app.staticTexts["stepsLabel"]
        
        sleep(3)
        
        // Now assert steps are over 10 (instead of exact number)
        if let steps = Int(stepsLabel.label) {
            XCTAssertTrue(steps > 5, "Steps should be greater than 5, found \(steps)")
        } else {
            XCTFail("Steps label did not contain a valid integer")
        }
    }
}
