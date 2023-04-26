//
//  Eleve.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 26/04/2023.
//

import Foundation

// on est obligé d'ajouter le protocol codable a la classe pour que les données soit dans le fichier JSON
class TimeCodable : Time, Codable{}


// classe pour la gestion d'élève(s)
class Eleve : Codable{
    
    private var nom : String?
    private var prenom : String?
    private var age : TimeCodable?
    private var classe : String?
    private var numero : Int?
    private var color : Float = 0 // gradient de couleur pour savoir si il est souvent la ou non
    private var notes : [Float]?
    private var infosPlus : String? // stockage commentaires

    // default
    public init(_ nom: String, _ prenom:String, _ age: TimeCodable, _ classe: String, _ numero: Int, _ infoPlus: String){
        if (nom != "" && prenom != "" && classe != "" && numero >= 0){
            self.nom = nom
            self.prenom = prenom
            self.age = age
            self.classe = classe
            self.numero = numero
            self.numero = numero
            self.infosPlus = infoPlus
        } else {
            print("données invalides")
        }

    }
    
    public func getnom()->String?{
        return self.nom
    }
    
    
}


// end page
