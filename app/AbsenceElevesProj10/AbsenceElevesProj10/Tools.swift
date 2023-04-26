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
    // car il risque d'y avoir beaucoupde fonctions pour chaques types sinon !!!!!!
    public static func SuperGetFirstIndex(_ of: Any, _ contenant : [Any])->Any?{
        var res : Any? = nil
        for (i, comp) in contenant.enumerated(){
            if (of == comp){
                res = i
            }// type Any cannot conform to RawPresentable
        }
        return res
    }
    // return first index into the list ONLY FOR INT TYPE
    // if not found return nil
    public static func getFirstIndex(_ elem:Int, _ contenant : [Int])->Int?{
        var res : Int? = nil
        var carry : Bool = true
        var cpt : Int = 0
        while(carry && cpt < contenant.count){
            if (elem == contenant[cpt]){
                res = cpt
                carry = false
            }
            cpt += 1
        }
        return res
    }
    
    
    // max of float list
    public static func max(_ content:[Float])->Float{
        var res : Float
        if (content.count > 0){
            var maxv:Float=content[0]
            for i in 0...content.count-1{if (content[i] > maxv){maxv = content[i]}}
            res = maxv
        };return res
    }
    // max of int list
    public static func max(_ content:[Int])->Int{
        var res : Int
        if (content.count > 0){
            var maxv:Int=content[0]
            for i in 0...content.count-1{if (content[i] > maxv){maxv = content[i]}}
            res = maxv
        };return res
    }
    public static func min(_ content:[Float])->Float{
        var res : Float
        if (content.count > 0){
            var maxv:Float=content[0]
            for i in 0...content.count-1{if (content[i] < maxv){maxv = content[i]}}
            res = maxv
        };return res
    }
    // max of int list
    public static func min(_ content:[Int])->Int{
        var res : Int
        if (content.count > 0){
            var maxv:Int=content[0]
            for i in 0...content.count-1{if (content[i] < maxv){maxv = content[i]}}
            res = maxv
        };return res
    }
    
    
}
