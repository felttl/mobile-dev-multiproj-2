//
//  Chercher_Mot_view_Controller.swift
//  projet_fin_global
//
//  Created by Felix Ton that-Lavarini on 05/04/2023.
//

import UIKit

class Chercher_Mot_view_Controller: UIViewController {

    // prises entrées
    @IBOutlet weak var tfWordInput: UITextField!
    @IBOutlet weak var labTraduit: UILabel!
    @IBOutlet weak var strErr: UILabel!
    // données
    public var inputTexte : String = ""
    public var choixLangue : Bool = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // on charge les données du JSON si elles ne sont pas les mêmes
        if (!self.estPareil(AppDelegate.tmots.tousLesMots)){
            AppDelegate.mots = Les_Mots(AppDelegate.tmots.tousLesMots).preLoadJSON()
        }
        
    }
    
    private func estPareil(_ listeDeMots: [Mot])->Bool{
        var res : Bool = true
        if (listeDeMots.count == AppDelegate.mots.count){
            var cpt : Int = 0
            while (res && cpt < listeDeMots.count){
                if (listeDeMots[cpt].get_en_anglais() != AppDelegate.mots[cpt].get_en_anglais() ||
                    listeDeMots[cpt].get_en_français() != AppDelegate.mots[cpt].get_en_français()){
                    res = false
                }
                cpt += 1
            }
        } else {res = false}
        return res
    }
    
    
    
    // "obtenir la traduction"
    @IBAction func traduire() {
        // mise a jour des données :
        // si l'utilisateur a saisi du texte
        if (self.tfWordInput.text != nil){
            self.inputTexte = tfWordInput.text!
            var mot_a_chercher = Mot(self.inputTexte, "")
            AppDelegate.mots.append(mot_a_chercher)
            if (Les_Mots(AppDelegate.mots).chercherMot(mot_a_chercher) == nil){
                self.labTraduit.text = "none"
                self.strErr.text = AppDelegate.tmots.getTxtErr()
            } else {
                self.labTraduit.text = AppDelegate.tmots.chercherMot(mot_a_chercher)!.get_en_anglais()
            }
            self.strErr.text = "validé avec succés"
        } else {
            // erreur
            self.strErr.text = "erreur champs manquant"
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
