//
//  Skieur.swift
//  projet 8 aintrainementCC
//
//  Created by Felix Ton that-Lavarini on 11/04/2023.
//

import Foundation
class Skieur: Codable{

    private var numDossard : Int
    private var nomSkieur : String
    private var note : Float
    
    public init(_ leDosssard: Int, _ leNomSkieur: String, _ laNote: Float){
        self.numDossard = leDosssard
        self.nomSkieur = leNomSkieur
        self.note = laNote
    }
    
    public func getNumDossard()->Int{
        return self.numDossard
    }
    public func getNomSkieur()->String{
        return self.nomSkieur
    }
    public func getNote()->Float{
        return self.note
    }
    
    
}
