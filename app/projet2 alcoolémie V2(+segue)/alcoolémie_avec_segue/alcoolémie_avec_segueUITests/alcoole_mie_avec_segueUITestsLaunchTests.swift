//
//  alcoole_mie_avec_segueUITestsLaunchTests.swift
//  alcoolémie_avec_segueUITests
//
//  Created by Felix Ton that-Lavarini on 22/03/2023.
//

import XCTest

final class alcoole_mie_avec_segueUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
