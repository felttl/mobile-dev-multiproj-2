//
//  GroupeEleve.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 26/04/2023.
//

import Foundation

func getFirstIndex(_ of: Character, _ contenant : String)->Int?{
    var res : Int? = nil
    var reach : [Character] = Array(contenant)
    for (i, comp) in reach.enumerated(){
        if (of == comp){
            res = i
        }
    }
    return res
}


// créer des objets groupe d'eleve pour simplifier les opérations de tri d'jout etc.. d'élèves
class GroupeEleve{
    private var listeEleves : [Eleve] = []
    
    
    public init(_ listeDEleves : [Eleve]){
        self.listeEleves = listeDEleves
    }
    
    // trie la liste par ordre alphabétique de nom
    public func trieAtoZ(){
        var res : [Any] = []
        // poids des lettres
        var poidsL : [Character] = Array("abcdefghijklmnopqrstuvwxyz".uppercased()+"abcdefghijklmnopqrstuvwxyz")
        var lesPoids : [Int] = []
        for unEleve in self.listeEleves{
            // l'eleve doit avoir un nom !
            if (unEleve.getNom() != nil){
                var poids : Int = 0
                // calcul du poid du mot
                for (i, char) in (unEleve.getNom()!.reversed().enumerated()){
                    // on récupère le poids de la lettre et on l'ajoute au poids
                    poids += pow(poidsL.index(of: char), i)
                }
                lesPoids.append(poids)
                poids = 0
            }

        }
        // on retrie les elève avec les poids de chaque noms
        for i in self.listeEleves{
            if lesPoids[i]
        }
    }
    
    
    
    
    
    
    
    
    
    
    // MARK: - DOCUMENTATION (minimalist)
    // display tiny doc
    public static func help(){
        print("""
            class : GroupeEleve
        
        
            +GroupeEleve([Eleve])
            // créer un groupe d'élèves







        """)
    }
    
    
    
}




// end page
