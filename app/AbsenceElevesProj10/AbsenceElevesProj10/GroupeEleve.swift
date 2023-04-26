//
//  GroupeEleve.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 26/04/2023.
//

import Foundation

// permet de stocker deux valeurs
struct Twice{
    var valueA: Any
    var valueB: Any
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
        var lesPoids : [Twice] = []
        var uniqueID: Int = 0
        for unEleve in self.listeEleves{
            // l'eleve doit avoir un nom !
            if (unEleve.getNom() != nil){
                var poids : Int = 0
                // calcul du poid du mot
                for (i, char) in (unEleve.getNom()!.reversed().enumerated()){
                    // on récupère le poids de la lettre et on l'ajoute au poids
                    poids += Int(pow(Float(Tools.getFirstIndex(char, poidsL)!), Float(i)))
                }
                lesPoids.append(Twice(valueA: poids, valueB: uniqueID))
                uniqueID += 1
            }

        }
        // on retrie les elève avec les poids de chaque noms
        var maxSort : Int
        for i in self.listeEleves{
            // on choisi le plus grand et on récupère son index
            // problème il peut y avoir plusieurs fois le même nombre
            // (donc il faut une structure avec des id spécifiques)
            maxSort = Tools.getFirstIndex(<#T##of: Character##Character#>, <#T##contenant: [Character]##[Character]#>) lesPoiTools.max(lesPoids)
            if (lesPoids[i].valueB
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
