//
//  Outils.swift
//  projet 8 aintrainementCC
//
//  Created by Felix Ton that-Lavarini on 11/04/2023.
//

import Foundation
class Outils{
    public static func RechercherMin(_ tableau: [Float])->Float{
        var res : Float = tableau[0]
        for i in 1...tableau.count-1{
            if (tableau[i] < res){
                res = tableau[i]
            }
        }
        return res
    }
    public static func RechercherMax(_ tableau: [Float])->Float{
        var res : Float = tableau[0]
        for i in 1...tableau.count-1{
            if (tableau[i] > res){
                res = tableau[i]
            }
        }
        return res
    }
    public static func SommeNotes(_ tableau: [Float])->Float{
        var res : Float = tableau[0]
        for i in 1...tableau.count-1{
            res += tableau[i]
        }
        return res
    }
    
    
}
