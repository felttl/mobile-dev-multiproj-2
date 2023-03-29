//
//  Evenement.swift
//  TD4 fichier JSON
//
//  Created by Felix Ton that-Lavarini on 28/03/2023.
//

import Foundation

class Evenement: Codable{
    private var titre : String
    private var lieu : String  // enum ?
    private var debut : String
    private var duree : Int // en minutes
    
    // constructeur
    public init(_ leTitre:String,_ leLieu: String,_ leDebut: String,_ laDuree:Int){
        self.titre = leTitre
        self.lieu = leLieu
        self.debut = leDebut
        self.duree = laDuree
    }
    
    // car privés :
    public func getTitre()->String{return self.titre}
    public func getLieu()->String{return self.lieu}
    public func getDebut()->String{return self.debut}
    public func getDuree()->Int{return self.duree}
    
    
}
