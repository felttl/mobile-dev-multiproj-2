//
//  UnitTestGroupeEleve.swift
//  AbsenceElevesProj10Tests
//
//  Created by Felix Ton that-Lavarini on 04/05/2023.
//

import XCTest
@testable import AbsenceElevesProj10 // trés important
final class UnitTestGroupeEleve: XCTestCase {

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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    //MARK: - custom tests
    
    
    
    /// tester si les élèves ont tous rangés dans l'ordre correctement
    func testEleveBienRangés() throws { // on oublie pas test devant le nom de fonction
        var ungroupeEleve : GroupeEleve = GroupeEleve(
            [
                Eleve("cris",
                      "chute",
                      TimeCodable(Date()),
                      nil,
                      451212,
                      0,
                      nil),
                Eleve("aurelie",
                      "ssqkhzae",
                      TimeCodable(Date()),
                      "L1-NEC",
                      458963,
                      1,
                      nil),
                Eleve("abbana",
                      "poizhaz",
                      TimeCodable(Date()),
                      "L2-NEC",
                      121233,
                      320,
                      "troujours absent")
            ]
        )
        ungroupeEleve.trieParNomAtoZ()
        // on remplis une liste pour savoir si c'est correct
        let testResultIntNum : [String] = []
        for eleve in ungroupeEleve{
            testResultIntStr
        }
        
        
    }
    
    

}
