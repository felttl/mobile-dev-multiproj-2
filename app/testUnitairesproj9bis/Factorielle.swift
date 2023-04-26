//
//  Factorielle.swift
//  projTestUnitaire9
//
//  Created by Felix Ton that-Lavarini on 26/04/2023.
//

import Foundation

class Factorielle {
    var n : Int
    public init(_ leNombre: Int){
        self.n = leNombre
    }
    public func calculer()->Int{
        var res : Int = 1
        for i in 2...self.n{
            res *= i
        }
        
        return res
    }
}

// end page
