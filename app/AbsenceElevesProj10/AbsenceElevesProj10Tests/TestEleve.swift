//
//  TestEleve.swift
//  AbsenceElevesProj10Tests
//
//  Created by Felix Ton that-Lavarini on 26/04/2023.
//

import XCTest
@testable import AbsenceElevesProj10
final class TestEleve: XCTestCase {

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
    
    //MARK: - Custom tests
    
    /// tester si le gradient de couleur s'effectue correctement
    func testGradient() throws {
        // rd
        let objEleve = Eleve(
            "jule",
             "aiuh",
             TimeCodable(Date()),
             nil,
            Int.random(in: Int(1e6)...Int(1e7-1)),
             3, // nb absences
             nil
        )

        // test avec 3 (30%) doit être inférieur a la moyenne( donc orange ou rouge)
        Eleve.setNewIntervalle([4, 14])
        var gdt : [Float] = objEleve.calcGradientAbsences()
        XCTAssertEqual(gdt, [0.3, 1, 0, 1.0])
        
        objEleve.setNBAbscences(5)
        gdt = objEleve.calcGradientAbsences()
        XCTAssertEqual(gdt, [1, 1, 0, 1])
        
        objEleve.setNBAbscences(9)
        gdt = objEleve.calcGradientAbsences()
        XCTAssertEqual(gdt, [1, 0.9, 0, 1])
        
        // tests aléatoires
        let aleaChoisi : Int = Int.random(in: 0...4)
        objEleve.setNBAbscences(aleaChoisi)
        gdt = objEleve.calcGradientAbsences()
        XCTAssertEqual(gdt, [Float(aleaChoisi)/10, 1, 0, 1])
        // test avec intervalle aléatoires
    }

    
    
    

}
