//
//  Tools.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 26/04/2023.
//

import Foundation

// permet de trier des éléments avec un ouple de valeur
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
    
    /// permet de savoir si la chaine contient uniquement des nombres ou non
    /// renvoie faux si elle contient des lettre ou tout autre élément différent des nombres
    public static func containsOnlyInt(_ string: String)->Bool{
        var res : Bool = true
        let num : [Character] = Array("0123456789")
        let tabCompare : [Character] = Array(string)
        // code here
        var cpt : Int = 0
        while (res && cpt < num.count){
            var cpt0 : Int = 0
            var carry2 : Bool = true
            while (carry2 && cpt0 < num.count){
                if (num[cpt0] == tabCompare[cpt]){
                    carry2 = false
                }
                cpt0 += 1
            }
            if (carry2){
                res = false
            }
            cpt += 1
        }
        return res
        
        
        
    }
    
    
}
