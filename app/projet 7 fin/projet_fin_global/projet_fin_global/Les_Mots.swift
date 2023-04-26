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
    
    
    // MARK: - JSON FILE
    public func write(){
        // singleton
        let leFM = FileManager.default
        let lesURL = leFM.urls(for: .documentDirectory, in: .userDomainMask)
        let laPremUrl = lesURL.first!
        let monURL = laPremUrl.appendingPathComponent("data.json")
        let dataSavedCoded = try? JSONEncoder().encode(self.tousLesMots)
        // créé fichier avec les données codées
        FileManager.default.createFile(atPath: monURL.path, contents: dataSavedCoded, attributes: nil)
        //exit(0)
    }
    
    
    // créer le fichier et ce qui est nécessaire si ce n'est pas le cas
    // sinon charge dirrectement les donnnées avec loadJSON
    public func preLoadJSON()->[Mot]{
        
        var resultMots : [Mot] = []
        let monUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("data.json")
        if (FileManager.default.fileExists(atPath: "data.json")){
            resultMots = self.loadJSON(monUrl)
        } else {
            print("le fichier n'existe pas on le créé")
            // on créé le fichier
            self.write()
            
        }
        return resultMots
    }
    
    // compare la liste d'objets avec une autre liste
    public func Pareil(_ estPareil: [Mot])->Bool{
        var res : Bool = true
        var cpt : Int = 0
        // pas la même taille on considère que c'est différent
        // pas la même taille on considère que c'est différent
        if (self.tousLesMots.count != estPareil.count){
            res = false
        }
        while (!res && cpt < self.tousLesMots.count){
            if (estPareil[cpt].get_en_anglais() != self.tousLesMots[cpt].get_en_anglais() ||
                estPareil[cpt].get_en_français() != self.tousLesMots[cpt].get_en_français()){
                res = false
            }
            cpt += 1
        }
        return res
    }
    
    
    public func loadJSON(_ uneurl: URL)->[Mot]{
        do {
            let data = try Data(contentsOf: uneurl)
            let decoder = JSONDecoder()
            let MotsDecodés = try decoder.decode([Mot].self, from: data)
            self.err = 0
            return MotsDecodés
        } catch {
            self.err = 4
            print(self.getTxtErr())
        }
        return []
    }
    
    
    // MARK: - InitS
    // permettre certaines sopérations sur les listes de mots :
    // overloaded
    public init(_ uneliste: [Mot]){
        self.tousLesMots = uneliste
    }
    public init(){
        // none
    }
    
    // MARK: - functs
    // renvoie une liste de mots triés en chaine et non en objet
    public func trierStrList()->[[String]]{
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
    public func chercherMot(_ unmot: Mot)->Mot?{
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
    // MARK: - errors management
    // renvoie du texte en fonction de l'erreur
    public func getTxtErr()->String{
        let clsname : String = "class : Les_mots : erreur :"
        var res : String
        switch self.err {
            case -1:
                res = "\(clsname)"
            case 1:
                res = "\(clsname) 'chercher_mot()' Attention liste vide"
            case 2:
                res = "\(clsname) 'chercher_mot()' le mot n'as pas été trouvé"
            case 3:
                res = "\(clsname) 'chercher_mot()' une erreur a été remarqué"
            case 4:
                res = "\(clsname) 'loadJSON()' le fichier n'existe pas"
            case 5:
                res = "\(clsname) 'preLoadJSON()' le fichier n'existe pas"
        default:
            res = ""
        }
        // self.err = 0 //  ?
        return res
    }
    
    
}


// end page
