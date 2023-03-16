//
//  TD2_frais_de_de_placementUITestsLaunchTests.swift
//  TD2 frais de déplacementUITests
//
//  Created by Felix Ton that-Lavarini on 16/03/2023.
//

import XCTest

final class TD2_frais_de_de_placementUITestsLaunchTests: XCTestCase {

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
