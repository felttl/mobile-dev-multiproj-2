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
        let ecrire = JSONEncoder()
        // spécifie le format de sortie
        ecrire.
        // on doit d'abord écraser les données précédentes si on a déja modifié / créé dess fichiers
        // on recrée ensuite un nouveau fichier pour mettre toutes les données à jour
        let data = try ecrire.encode(Evenement)
        
    }
    
    public static func chargementJSON(_ nom_fichier: String="fichierJSON_qui_existe_pas(encore)")-> [Evenement]{
        let leFileManager = FileManager.default
        let urls = leFileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let urlDocument = urls.first!.appendingPathComponent(nom_fichier)
        // on vérifie que le fichier existe bien la ou on la demande :
        if (leFileManager.fileExists(atPath: urlDocument.description)){
            // si le fichier existe on charge avec la fonction 2
            return self.loadJSON(uneurl: urlDocument)
        } else {
            print("le fichier n'existe pas")
            exit(0)
        }
        
    }

    // deuxième fonction pour le chargement
    private static func loadJSON(uneurl: URL)->[Evenement]{
        // on charge les données :
        let mesDonnées = try Data(contentsOf: uneurl)
        var res = JSONDecoder()
        res.decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)
        
        
        
        return res
    }
    
    
}
