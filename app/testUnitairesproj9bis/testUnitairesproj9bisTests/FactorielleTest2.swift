//
//  FactorielleTest2.swift
//  testUnitairesproj9bisTests
//
//  Created by Felix Ton that-Lavarini on 26/04/2023.
//

import XCTest
@testable import testUnitairesproj9bis

final class FactorielleTest2: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    // MARK: -test customisés
    
    
    func testFactorielle5() throws {
        var res : Int
        var objFactorielle5 : Factorielle
        objFactorielle5 = Factorielle(5)
        res = objFactorielle5.calculer()
        XCTAssertEqual(120, res)
    }

    
    func testFactorielle4() throws {
        var res : Int
        var objFactorielle5 : Factorielle
        objFactorielle5 = Factorielle(4)
        res = objFactorielle5.calculer()
        XCTAssertEqual(24, res)
    }
    
    // -------------------------------------------
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    

    
    
    
}
