//
//  Evenement.swift
//  TD3 Agenda
//
//  Created by Felix Ton that-Lavarini on 15/03/2023.
//

import Foundation

class Evenement {
    private var titre : String
    private var lieu : String
    private var debut : String
    private var duree : Int // exprimée en minutes
    
    // constructeurs 
    public init(_ leTitre : String,_ leLieu : String,_ leDebut : String,_ laDuree : Int){
        self.titre = leTitre
        self.lieu = leLieu
        self.debut = leDebut
        self.duree = laDuree
    }
    public func getTitre() -> String{
        return self.titre
    }
    
    public func getDebut() -> String {
        return self.debut
    }
    
    public func getDuree() -> Int{
        return self.duree
    }
    
    public func getLieu() -> String{
        return self.lieu
    }
    
    
}

// 2) il faut choisir "TableViewController"


// end page

