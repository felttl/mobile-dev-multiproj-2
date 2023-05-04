//
//  GroupeEleve.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 26/04/2023.
//

import Foundation



// créer des objets groupe d'eleve pour simplifier les opérations de tri d'jout etc.. d'élèves
class GroupeEleve: Codable{
    private var listeEleves : [Eleve] = []
    private var listeClasses : [String] = []
    
    public init(_ listeDesleves : [Eleve]){
        self.listeEleves = listeDesleves
        // on charge dirrecement toutes les classes
        self.chargeClasses(listeDesleves)
    }
    
    
    /// cherche un élève avec son numéro étudiant
    public func ChercherEleve(_ numEtud: Int)->Int?{
        var res : Int? = nil
        var cpt : Int = 0
        var carry : Bool = true
        while (carry && cpt < self.listeEleves.count-1){
            if (numEtud == self.listeEleves[cpt].getNumero()){
                res = cpt
                carry = false  // diminuer la complexité
            }
            cpt += 1
        }
        return res
    }
    
    /// cherche un élève avec son nom (renvoie une liste de plusieur étudiants si plusieurs ont le même nom)
    public func ChercherEleve(_ NomEtudiant: String)->[Int?]{
        var res : [Int?] = []
        for i in 0...self.listeEleves.count-1{
            if (NomEtudiant == self.listeEleves[i].getNom()){
                res.append(i)
            }
        }
        return res
    }
    
    
    /// trie la liste par ordre alphabétique de nom (de A à Z)
    public func trieParNomAtoZ(){
        var res : [Eleve] = []
        // poids des lettres
        let poidsL : [Character] = Array("abcdefghijklmnopqrstuvwxyz".uppercased()+"abcdefghijklmnopqrstuvwxyz")
        var lesPoids : [Int] = [] // value, indexes
        for unEleve in self.listeEleves{
            // l'eleve doit avoir un nom !
            if (unEleve.getNom() != nil){
                var poids : Int = 0
                // calcul du poid du mot
                for (i, char) in (unEleve.getNom()!.reversed().enumerated()){
                    // on récupère le poids de la lettre et on l'ajoute au poids
                    poids += Int(pow(Float(Tools.getFirstIndex(char, poidsL)!), Float(i)))
                }
                lesPoids.append(poids)
            }
        }
        // on retrie les elève avec les poids de chaque noms
        var maxIndex : Int
        for _ in self.listeEleves{
            // on choisi le plus grand et on récupère son index
            // problème il peut y avoir plusieurs fois le même nombre
            // (donc il faut une structure avec des id spécifiques)
            maxIndex = Tools.getFirstIndex(Tools.max(lesPoids),lesPoids)! // on le trouve forcément
            // il ne peux y en avoir qu'un car c'est un maximum
            res.append(self.listeEleves[maxIndex])
            // une fois trouvé on le modifie dans la liste pour ne pas repasser dedans et on peut pas le
            // supprimer car ça changerait les coordonnées dans self.liste Eleves
            lesPoids[maxIndex] = -1 // toujours le minimum
        }
        self.listeEleves = res
    }
    
    // trie le groupe d'élèves selon leurs classes
    public func trieParClasse(){
        var res : [Eleve] = []
        var cpt1 : Int = 0
        var cpt2 : Int = 0
        var carry : Bool = true
        while(carry && cpt1 == self.listeEleves.count){
            while (cpt2 < self.listeClasses.count && carry){
                if(self.listeEleves[cpt1].getClasse() != nil && self.listeEleves[cpt2].getClasse()! == self.listeClasses[cpt2]){
                    // on ajoute
                    res.append(self.listeEleves[cpt2])
                } else {
                    print("on ne peut pas trier les élèves car certains n'ont pas de classe")
                    carry = false
                }
                cpt2 += 1
            }
            cpt2 = 0
            cpt1 += 1
        }
        self.listeEleves = res
    }
    
    // permet de diminuer la complexité de calcul pour le trie par classe (moins long)
    // met les diffénts noms de classes trouvés dans la liste dédié
    private func chargeClasses(_ Eleves: [Eleve]){
        // éviter les doublons
        for unEleve in self.listeEleves{
            // si on l'a pas déja on l'ajoute
            if (Tools.getFirstIndex(unEleve.getClasse()!, self.listeClasses) == nil){
                self.listeClasses.append(unEleve.getClasse()!)
            }
        }
        
    }
    
    // MARK: - Get Methods
    
    public func getlisteEleve()->[Eleve]{
        return self.listeEleves
    }
    public func getlisteClasses()->[String]{
        return self.listeClasses
    }
    public func editEleve(_ idx: Int,_ lEleve: Eleve){
        self.listeEleves[idx] = lEleve
    }
    public func ajouterEleve(_ E : Eleve){
        self.listeEleves.append(E)
    }
    
    // MARK: - JSON management files :
    //  pas besoin de coder la liste des classes des élèves car on possède déja la liste
    //  des élèves et les données sont dedans
    /// write data into json file(s) ("data.json" "classnames.json")
    public func write(){
        // singleton
        let leFM = FileManager.default
        let lesURL = leFM.urls(for: .documentDirectory, in: .userDomainMask)
        let laPremUrl = lesURL.first!
        let monURL = laPremUrl.appendingPathComponent("data.json")
        let jsonDataSavedCoded = try? JSONEncoder().encode(self.getlisteEleve())
        FileManager.default.createFile(atPath: monURL.path, contents: jsonDataSavedCoded, attributes: nil)
    }
    
//    private var listeEleves : [Eleve] = []
//    private var listeClasses : [String] = []
    /// insert json data into data class space
    public func preLoadJson(){
        // url du singleton (le premier)
        let monUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("data.json")
        // si le fichier existe :
        if (FileManager.default.fileExists(atPath: monUrl.path)){
            self.loadJSON(monUrl)
        } else {
            print("le fichier n'existe pas on le créé")
            self.write()
        }
        
        
    }
    
    /// load json data into list of Eleve content
    private func loadJSON(_ url: URL){
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()// on utilise la classe comme la class Tools
            // insertions des données
            self.listeEleves = try decoder.decode([Eleve].self, from: data)
            print("données correctement chargées")
        } catch {
            print("problème de chargement des données")
        }
        self.listeEleves = []
    }

    
    
    
    
    
    // MARK: - DOCUMENTATION (minimalist)
    // display tiny doc
    public static func help(){
        print("""
            class : GroupeEleve
        
        
            +GroupeEleve([Eleve])
            // créer un groupe d'élèves







        """)
    }
    
    
    
}




// end page
