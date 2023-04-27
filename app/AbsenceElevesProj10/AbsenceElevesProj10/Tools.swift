//
//  Tools.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 26/04/2023.
//

import Foundation

// permet de triser des éléments avec un ouple de valeur
// id et contenu que l'on veut trier
struct Twice{
    var id : Int
    var value : Any
}


// obligé de faire une classe pour stocker tous mes outils
// car impossible d'appeler des fonctions a partir d'un fichier
// séparé !
class Tools{  // abstract #noData
    public static func getFirstIndex(_ of: Character, _ contenant : [Character])->Int?{
        var res : Int? = nil
        for (i, comp) in contenant.enumerated(){
            if (of == comp){
                res = i
            }
        }
        return res
    }
    // on peut comparer des valeurs avec des types différents ?
    // car il risque d'y avoir beaucoup de fonctions pour chaques types sinon !!!!!!
    public static func getFirstIndex(_ of: Int, _ contenant : [Int])->Int?{
        var res : Int? = nil
        for (i, comp) in contenant.enumerated(){
            if (of == comp){
                res = i
            }// type Any cannot conform to RawPresentable (of any type : (Any == [Any][Int], never done))
        }
        return res
    }
    public static func getFirstIndex(_ of: String, _ contenant : [String])->Int?{
        var res : Int? = nil
        for (i, comp) in contenant.enumerated(){
            if (of == comp){
                res = i
            }
        }
        return res
    }
    
    
    // max of float list
    public static func max(_ content:[Float])->Float{
        var res : Float = content[0]
        if (content.count > 0){
            var maxv:Float=content[0]
            for i in 0...content.count-1{if (content[i] > maxv){maxv = content[i]}}
            res = maxv
        };return res
    }
    // max of int list
    public static func max(_ content:[Int])->Int{
        var res : Int = content[0]
        if (content.count > 0){
            var maxv:Int=content[0]
            for i in 0...content.count-1{if (content[i] > maxv){maxv = content[i]}}
            res = maxv
        };return res
    }
    public static func min(_ content:[Float])->Float{
        var res : Float = content[0]
        if (content.count > 0){
            var maxv:Float=content[0]
            for i in 0...content.count-1{if (content[i] < maxv){maxv = content[i]}}
            res = maxv
        };return res
    }
    // max of int list
    public static func min(_ content:[Int])->Int{
        var res : Int = content[0]
        if (content.count > 0){
            var maxv:Int=content[0]
            for i in 0...content.count-1{if (content[i] < maxv){maxv = content[i]}}
            res = maxv
        };return res
    }
    
    
}
