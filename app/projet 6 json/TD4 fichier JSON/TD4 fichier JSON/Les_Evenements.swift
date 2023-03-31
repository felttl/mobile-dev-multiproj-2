//
//  Les_Evenements.swift
//  TD4 fichier JSON
//
//  Created by Felix Ton that-Lavarini on 28/03/2023.
//

import Foundation


class Les_Evenements{
    
    
    // nom fichier pour éviter des le réécrire plusieurs fois
    private var filename : String = ""
    // plus tard on peut faire une liste pour avoir tout les noms des chemin de fichiers ...
    
    // AppDelegate appelle cette procédure
    // sauvegarde en JSON nos objets swift
    public static func ecritureJSON(_ tousLesEvenements: [Evenement]){
        var url = FileManager.default
        url = url.urls(for: .documentDirectory, in: .userDomainMask).first!
        url = url.appendingPathComponent(self.filename)
        let dataSavedCoded = try? JSONDecoder().encode(tousLesEvenements)
        // crééer le fichier
        FileManager.default.createFile(atPath: url.path, contents: dataSavedCoded, attributes: nil)
        exit(0)
    }
    
    public static func chargementJSON(_ nom_fichier: String="fichierJSON_qui_existe_pas(encore).json")-> [Evenement]{
        self.filename = nom_fichier
        var resultMessages : [Evenement] = []
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(nom_fichier)
        // on vérifie que le fichier existe bien la ou on la demande :
        if (FileManager.default.fileExists(atPath: url.path)){ // urlDocument.path deprecated (sooner)
            // si le fichier existe on charge avec la fonction 2
            resultMessages = self.loadJSON(uneurl: url)!
        } else {
            print("le fichier n'existe pas")
            exit(0)
        }
        return resultMessages
    }

    // avec une url de fichier json on renvoie la reconstruction des objets en swift a partir du json
    private static func loadJSON(uneurl: URL)->[Evenement]?{
        do {
            let data = try Data(contentsOf: uneurl)
            let decoder = JSONDecoder()
            let EvenementsDécodés = try decoder.decode([Evenement].self, from: data)
            return EvenementsDécodés
        } catch {
            print("erreur :\(erreur)")
        }
        return nil
    }
    
    
}





// end page
