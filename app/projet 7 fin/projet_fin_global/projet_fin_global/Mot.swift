//
//  Mot.swift
//  projet_fin_global
//
//  Created by Felix Ton that-Lavarini on 05/04/2023.
//

import Foundation

class Mot{
    
    
    private var en_français : String = ""
    private var en_anglais : String = ""
    
    
    // créé on objet mot
    public init(_ enFR: String="", _ enEN: String=""){
        self.en_français = enFR
        self.en_anglais = enEN
    }
    
    
    // set
    public func set_fr(_ newstrfr: String){
        self.en_français = newstrfr
    }
    public func set_en(_ newstren: String){
        self.en_anglais = newstren
    }
    
    
    
    // get
    public func get_en_français()->String{
        return self.en_français
    }
    public func get_en_anglais()->String{
        return self.en_anglais
    }
    
    
}
