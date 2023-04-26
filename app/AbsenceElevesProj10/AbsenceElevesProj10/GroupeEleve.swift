//
//  GroupeEleve.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 26/04/2023.
//

import Foundation



// créer des objets groupe d'eleve pour simplifier les opérations de tri d'jout etc.. d'élèves
class GroupeEleve{
    private var listeEleves : [Eleve] = []
    private var listeClasses : [String] = []
    
    public init(_ listeDesleves : [Eleve]){
        self.listeEleves = listeDesleves
        // on charge dirrecement toutes les classes
        self.chargeClasses(listeDesleves)
    }
    
    // trie la liste par ordre alphabétique de nom (de A à Z)
    public func trieParNomAtoZ(){
        var res : [Eleve] = []
        // poids des lettres
        var poidsL : [Character] = Array("abcdefghijklmnopqrstuvwxyz".uppercased()+"abcdefghijklmnopqrstuvwxyz")
        var lesPoids : [Int] = [] // value, indexes
        for unEleve in self.listeEleves{
            // l'eleve doit avoir un nom !
            if (unEleve.getNom() != nil){
                var poids : Int = 0
                // calcul du poid du mot
                for (i, char) in (unEleve.getNom()!.reversed().enumerated()){
                    // on récupère le poids de la lettre et on l'ajoute au poids
                    poids += Int(pow(Float(Tools.getFirstIndex(char, poidsL)!), Float(i)))
                }
                lesPoids.append(poids)
            }
        }
        // on retrie les elève avec les poids de chaque noms
        var maxIndex : Int
        for _ in self.listeEleves{
            // on choisi le plus grand et on récupère son index
            // problème il peut y avoir plusieurs fois le même nombre
            // (donc il faut une structure avec des id spécifiques)
            maxIndex = Tools.getFirstIndex(Tools.max(lesPoids),lesPoids)! // on le trouve forcément
            // il ne peux y en avoir qu'un car c'est un maximum
            res.append(self.listeEleves[maxIndex])
            // une fois trouvé on le modifie dans la liste pour ne pas repasser dedans et on peut pas le
            // supprimer car ça changerait les coordonnées dans self.liste Eleves
            lesPoids[maxIndex] = -1 // toujours le minimum
        }
        self.listeEleves = res
    }
    
    // trie le groupe d'élèves selon leurs classes
    public func trieParClasse(){
        var res : [Eleve] = []
        for i in 0...self.listeEleves.count-1{
            for classe in self.listeEleves{
                if (self.listeEleves[i].getClasse() != nil && self.listeEleves[i].getClasse()! == classe){
                    // on ajoute
                    res.append(self.listeEleves[i])
                } else{
                    print("on ne peut pas trier les élèves car certains n'ont pas de classe")
                    
                }

            }
        }
        self.listeEleves = res
        
    }
    
    // permet de diminuer la complexité de calcul pour le trie par classe (moins long)
    // met les diffénts noms de classes trouvés dans la liste dédié
    private func chargeClasses(_ Eleves: [Eleve]){
        // éviter les doublons
        for unEleve in self.listeEleves{
            // si on l'a pas déja on l'ajoute
            if (Tools.getFirstIndex(unEleve.getClasse(), self.listeClasses) == nil){
                self.listeClasses.append(unEleve.getClasse()!)
            }
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
