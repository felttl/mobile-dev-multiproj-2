//
//  Les_Evenements.swift
//  TD4 fichier JSON
//
//  Created by Felix Ton that-Lavarini on 28/03/2023.
//

import Foundation


class Les_Evenements{
    
    // écrit dans un fichier
    public static func ecritureJSON(_ tousLesEvenements: [Evenement]){
        
    }
    
    public static func chargementJSON(_ nom_fichier: String="fichierJSON_qui_existe_pas(encore)")-> [Evenement]{
        let leFileManager = FileManager.default
        let urls = leFileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let urlDocument = urls.first!.appendingPathComponent(nom_fichier)
        // on vérifie que le fichier existe bien la ou on la demande :
        leFileManager. .fileExists(atPath: urlDocument)
        
    }

    private static func loadJSON(uneurl: URL)->[Evenement]{
        
    }
    
    
}
