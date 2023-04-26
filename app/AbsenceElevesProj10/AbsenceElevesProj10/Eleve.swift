//
//  Eleve.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 26/04/2023.
//

import Foundation

// on est obligé d'ajouter le protocol codable a la Classe
// pour que les données soit dans le fichier JSON
class TimeCodable : Time, Codable{}


// Classe pour la gestion d'élève(s)
class Eleve : Codable{
    
    private var Nom : String?
    private var Prenom : String?
    private var Age : TimeCodable?
    private var Classe : String?
    private var Numero : Int?
    private var Color : Float = 0 // gradient de couleur pour savoir si il est souvent la ou non
    private var Notes : [Float]?
    private var InfosPlus : String? // stockAge commentaires

    // default
    public init(_ Nom: String, _ Prenom:String, _ Age: TimeCodable, _ Classe: String, _ Numero: Int, _ infoPlus: String){
        if (Nom != "" && Prenom != "" && Classe != "" && Numero >= 0){
            self.Nom = Nom
            self.Prenom = Prenom
            self.Age = Age
            self.Classe = Classe
            self.Numero = Numero
            self.Numero = Numero
            self.InfosPlus = infoPlus
        } else {
            print("données invalides")
        }

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - Get methods ->
    
    public func getNom()->String?{
        return self.Nom
    }
    public func getPrenom()->String?{
        return self.Nom
    }
    public func getAge()->TimeCodable?{
        return self.Age
    }
    public func getClasse()->String?{
        return self.Classe
    }
    public func getNumero()->Int?{
        return self.Numero
    }
    public func getColor()->Float{ // dégradé rvb jaune->Rouge (variation teintes de vert)
        return self.Color
    }
    public func getNotes()->[Float]?{
        return self.Notes
    }
    public func getInfosPlus()->String?{
        return self.InfosPlus
    }
    
}


// end pAge
