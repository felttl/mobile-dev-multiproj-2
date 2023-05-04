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
    private static var ABSIntervalle : [Int] = [0, 20] // 20 absence par mois élevé
    private var Notes : [Float]
    private var nbAbsences : Int = 0  // But de l'application
    private var InfosPlus : String? // stockAge commentaires

    // MARK: - constructor
    // default
    /// constructeur de la classe (overloaded)
    public init(_ Nom: String, _ Prenom:String, _ Age: TimeCodable, _ Classe: String, _ Numero: Int,_ nbAbsence:Int, _ infoPlus: String){
        if (Nom != "" && Prenom != "" && Classe != "" && Numero >= 0){
            self.Nom = Nom
            self.Prenom = Prenom
            self.Age = Age
            self.Classe = Classe
            self.Numero = Numero
            self.InfosPlus = infoPlus
            self.nbAbsences = nbAbsence
            self.Notes = []
        } else {
            print("données invalides")
            exit(0)
        }
    }
    /// constructeur avec des données pouvant être vides (overloaded)
    public init(_ Nom: String?, _ Prenom:String?, _ Age: TimeCodable?, _ Classe: String?, _ Numero: Int?,_ nbAbsence:Int, _ infoPlus: String?){
            self.Nom = Nom
            self.Prenom = Prenom
            self.Age = Age
            self.Classe = Classe
            self.Numero = Numero
            self.InfosPlus = infoPlus
            self.nbAbsences = nbAbsence
            self.Notes = []
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
    public func getColor()->Float{
        // dégradé rvb jaune->Rouge (variation teintes de vert)
        return self.Color
    }
    public func getNotes()->[Float]{
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
        let none : String = "pas de données"
        var res : String = ""
        res += "Nom : \(self.getNom() ?? none)\n"
        res += "Prenom : \(self.getPrenom() ?? none)\n"
        res += "Age : \(self.getAge()?.getDate() ?? none)\n"
        // except classname (show in sections)
        res += "Numero : \((String(self.getNumero() ?? -1) == "-1") ? none : String(self.getNumero()!))\n"
        res += "Note(s) :\((self.getNotes().count == 0) ? none : "\(self.getNotes())"))\n"
        res += "infos supplémentaires: \(self.getInfosPlus() ?? none)\n"
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
    /// set [min, max] absence intervalle
    public static func setNewIntervalle(_ minmax : [Int]){
        if (minmax.count != 2){
            print("il doit y avoir 2 paramètres uniquement")
        } else {
            Eleve.ABSIntervalle = minmax
        }
    }

    //MARK: - other methods/functions

    /// calcule le gradient pour pouvoir avoir une couleur proportionelle a l'absence de l'élève
    /// return style: [Float, Float, Float, Float]
    /// (fonction a portée d'objet utilisant une variable de classe)
    ///  (+ pratique)(car l'intervalle d'absence (toléré) doit être partagé entre tous les élèves)
    public func calcGradientAbsences()->[Float]{
        var rgbA : [Float] = [1.0,1.0,0,1.0]
        // FULL COLOR FORMAT
        // jamais la :          255,000,0,1 (trop d'absence) +∞
        // moyennement la :     255,255,0,1
        // tous le temps la :   000,255,0,1 (aucune absence) 0
        // on convertit tout entre 0 et 1
        let comp : Int = self.getNBAbscences()
        let milieu : Float = abs(Float(Int(Eleve.ABSIntervalle[0])-Int(Eleve.ABSIntervalle[1])))/2
        // si absintervall est pas dans l'intervalle
        if (Float(comp) < milieu){
            rgbA[0] = Float(comp)/Float(Eleve.ABSIntervalle[1]-Eleve.ABSIntervalle[0])
        } else if (Float(comp) > milieu){
            rgbA[1] = Float(Float(comp)/Float(Eleve.ABSIntervalle[1]-Eleve.ABSIntervalle[0]))
        }
        return rgbA
    }

    
    
    
    

}


// end page
