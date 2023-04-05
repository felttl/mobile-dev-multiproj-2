//
//  les_mots.swift
//  projet_fin_global
//
//  Created by Felix Ton that-Lavarini on 05/04/2023.
//

import Foundation

//SNAKE CASE NOTATION !

class Les_Mots{
    
    public var tous_les_mots : [Mot]
    
    // aggregation
    public init(){
        self.tous_les_mots = []
    }
    

    // par ordre aphabétique
    public static func trier(){
        // plus tard
    }
    
    // renvoie le mot si trouvé sinon chaine : "erreur pas trouvé !!!"
    public func chercher_mot(_ unmot: Mot)->String{
        var cpt = 0
        var carry : Bool = true
        var result : String = "erreur pas trouvé !!!"
        while (carry && cpt < self.tous_les_mots.count){
            if (self.tous_les_mots[cpt].get_en_français() == unmot.get_en_français()){
                result = self.tous_les_mots[cpt].get_en_anglais()
                carry = false
            }
            carry += 1
        }
        return result
    }
    
    
}


// end page
