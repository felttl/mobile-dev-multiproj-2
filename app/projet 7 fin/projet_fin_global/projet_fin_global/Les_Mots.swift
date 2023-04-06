//
//  les_mots.swift
//  projet_fin_global
//
//  Created by Felix Ton that-Lavarini on 05/04/2023.
//

import Foundation

//SNAKE CASE NOTATION !

// sert a charger les listes en JSON pour obtenir les mots en swift
class Les_Mots: Codable { // créée un "les mots" pour simplifier les tri de groupe de mots
    
    public var tousLesMots : [Mot] = []
    // err 1 = liste vide, 2 = pas trouvé, 3 = ...
    public var err : Int = 0 // defaut c'est bon
    
    //pas de constructeur
    
    public func write(_ tousLesMots: [Mot]){
        // singleton
        var leFM = FileManager.default
        var lesURL = leFM.urls(for: .documentDirectory, in: .userDomainMask)
        var laPremUrl = lesURL .first!
        var monURL = laPremUrl.appendingPathComponent("data.json")
        let dataSavedCoded = try? JSONEncoder().encode(tousLesMots)
        // créé fichier
        FileManager.default.createFile(atPath: monURL.path, contents: dataSavedCoded, attributes: nil)
        exit(0)
    }
    
    
    // créer le fichier et ce qui est nécessaire si ce n'est pas le cas
    // sinon charge dirrectement les donnnées avec loadJSON
    public func pre_loadJSON()->[Mot]{
        var resultMots : [Mot] = []
        let monUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("data.json")
        if (FileManager.default.fileExists(atPath: "data.json")){
            resultMots = self.loadJSON(monUrl)
        } else {
            print("le fichier n'existe pas")
            exit(0)
        }
    }
    
    public func loadJSON(_ uneurl: URL)->[Mot]?{
        do {
            let data = try Data(contentsOf: uneurl)
            let decoder = JSONDecoder()
            let MotsDecodés = try decoder.decode([Mot].self, from: data)
            return MotsDecodés
        } catch {
            self.err = 4
            print("erreur")
        }
        return nil
    }
    

    // renvoie une liste de mots triés
    public static func trier_str_list()->[[String]]{
        // plus tard
        
        // je peux juste renvoyer une liste de mots
        // triés ?
        var resEN : [String] = []
        var resFR : [String] = []
        for objword in self.tousLesMots{
            resEN.append(objword.get_en_anglais())
            // en français
            resFR.append(objword.get_en_français())
        }
        resEN = resEN.sorted()
        resEN = resFR.sorted()
        return [resEN, resFR]
    }
    // trie le contenu de la liste principale par ordre aphabétique
    public func trier(){
        // code
    }
    
    // renvoie le mot si trouvé sinon chaine : "erreur pas trouvé !!!"
    public func chercher_mot(_ unmot: Mot)->Mot?{
        var result : Mot? = nil
        if (self.tousLesMots.count != 0){
            var cpt = 0
            var carry : Bool = true
            while (carry && cpt < self.tousLesMots.count){
                if (self.tousLesMots[cpt].get_en_français() == unmot.get_en_français() ||
                    self.tousLesMots[cpt].get_en_anglais() == unmot.get_en_anglais()){
                    result = self.tousLesMots[cpt]
                    carry = false
                }
                cpt += 1
            }
            self.err = (carry) ? 2 : 0
        } else {
            self.err = 1
        }
        return result
    }
    
    // renvoie du texte en fonction de l'erreur
    public func get_txt_err()->String{
        var res : String
        switch self.err {
            case 1:
                res = "Attention liste vide"
            case 2:
                res = "dans 'chercher_mot()' le mot n'as pas été trouvé"
            case 3:
                res = "dans 'chercher_mot()' une erreur a été remarqué"
        default:
            res = ""
        }
        return res
    }
    
    
}


// end page
