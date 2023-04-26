//
//  Tools.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 26/04/2023.
//

import Foundation


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
    public static func SuperGetFirstIndex(_ of: Any, _ contenant : [Any])->Any?{
        var res : Any? = nil
        for (i, comp) in contenant.enumerated(){
            if (type(of: of) == type(of: i) && of == comp){
                res = i
            }// type Any cannot conform to RawPresentable
        }
        return res
    }
    // max of float list
    public static func max(_ content:[Float])->Float?{
        var res : Float? = nil
        if (content.count > 0){
            var maxv:Float=content[0]
            for i in 0...content.count-1{if (content[i] > maxv){maxv = content[i]}}
            res = maxv
        };return res
    }
    // max of int list
    public static func max(_ content:[Int])->Int?{
        var res : Int? = nil
        if (content.count > 0){
            var maxv:Int=content[0]
            for i in 0...content.count-1{if (content[i] > maxv){maxv = content[i]}}
            res = maxv
        };return res
    }
    
    
    
}
