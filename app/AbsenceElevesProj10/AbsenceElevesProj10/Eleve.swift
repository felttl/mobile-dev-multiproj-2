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
class Eleve : Codable{//Codable protocol not class
    
    private var Nom : String?
    private var Prenom : String?
    private var Age : TimeCodable?
    private var Classe : String?
    private var Numero : Int?
    private var Color : Float = 0 // gradient de couleur pour savoir si il est souvent la ou non
    private var Notes : [Float]?
    private var nbAbsences : Int = 0  // But de l'application
    private var InfosPlus : String? // stockAge commentaires

    // default
    public init(_ Nom: String, _ Prenom:String, _ Age: TimeCodable, _ Classe: String, _ Numero: Int,_ nbAbsence:Int, _ infoPlus: String){
        if (Nom != "" && Prenom != "" && Classe != "" && Numero >= 0){
            self.Nom = Nom
            self.Prenom = Prenom
            self.Age = Age
            self.Classe = Classe
            self.Numero = Numero
            self.Numero = Numero
            self.InfosPlus = infoPlus
            self.nbAbsences = nbAbsence
        } else {
            print("données invalides")
        }

    }
    
    // calcule le gradient pour pouvoir avoir une couleure
    public func calcGradient(){
        // contenu
    }
    
    
    
    
    
    
    
    
    
    
    // poser question : comment on fait l'attribut color déja ?
    
    
    
    
    
    
    
    
    
    
    
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
    public func getNBAbscences()->Int{
        return self.nbAbsences
    }
    
    
    /// renvoie toutes les informatiosn en lignes (comme une fiche)
    /// (les informations a afficher dans une section classe pour l'eleve)
    public func getAllInfos()->String{
        var res : String = ""
        res += "Nom : \(self.getNom() ?? "")\n"
        res += "Prenom : \(self.getPrenom() ?? "")\n"
        res += "Age : \(self.getAge()?.getDate() ?? "")\n"
        // except classname (show in sections)
        res += "Numero : \(String((self.getNumero() == nil) ? "" : self.getNumero()))\n"
        res += ""
        return res
        
    }
    
    
    
    // MARK: - Edit/set methods ->
        
    // a voir si c'est intéressant de faire ça (pour tous)
    
    public func setNom(_ nom: String){
        self.Nom = nom
    }
    public func setPrenom(_ prenom:String){
        self.Nom = prenom
    }
    public func setAge(_ age: TimeCodable){
        self.Age = age
    }
    public func setClasse(_ classe: String){
        self.Classe = classe
    }
    public func setNumero(_ numero: Int){
        self.Numero = numero
    }
    // pas de set avec color car fonctionnement interne
    public func setNotes(_ notes: [Float]){
        self.Notes = notes
    }
    public func setInfosPlus(_ infos:String){
        self.InfosPlus = infos
    }
    public func setNBAbscences(_ nbabsences:Int){
        if (nbabsences >= 0){
            self.nbAbsences = nbabsences
        } else {
            print("nombre d'absence invalide")
            exit(0)
        }
    }

    
}


// end pAge
