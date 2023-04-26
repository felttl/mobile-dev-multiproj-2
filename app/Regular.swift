//
//  Regular.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 26/04/2023.
//

import Foundation




func regularTest(){
    func isEqual<T: Equatable>(type: T.Type, a: Any, b: Any) -> Bool {
        guard let a = a as? T, let b = b as? T else { return false }
        return a == b
    }
    var any1: Any = 2
    var any2: Any = 1
    var any3: Any = "test"
    var any4: Any = "test"
    print(isEqual(type: Int.self, a: any1, b: any2)    )  // true
    print(isEqual(type: Int.self, a: any2, b: any3)    )  // false
    print(isEqual(type: String.self, a: any3, b: any4) )  // true


}


infix operator ===
func ===<T: Equatable>(_ a:T,_ b:T)->Bool{
    return a == b
}
/*
infix operator ===
func ===<T: Equatable>(_ a:Any,_ b:Any)->Bool{
    guard let a = a as? T, let b = b as? T else { return false }
    return a == b
}*/
