//
//  Chercher_Mot_view_Controller.swift
//  projet_fin_global
//
//  Created by Felix Ton that-Lavarini on 05/04/2023.
//

import UIKit

class Chercher_Mot_view_Controller: UIViewController {

    // prises entrées
    @IBOutlet weak var tf_word_input: UITextField!
    @IBOutlet weak var lab_traduit: UILabel!
    @IBOutlet weak var str_err: UILabel!
    // données
    public var input_texte : String = ""
    public var choix_langue : Bool = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // "obtenir la traduction"
    @IBAction func traduire() {
        // mise a jour des données :
        // si l'utilisateur a saisi du texte
        if (self.tf_word_input.text != nil){
            self.input_texte = tf_word_input.text!
            var mot_a_chercher = Mot(self.input_texte, "")
            AppDelegate.mots.append(mot_a_chercher)
            if (Les_Mots(AppDelegate.mots).chercherMot(mot_a_chercher) == nil){
                self.lab_traduit.text = "none"
                self.str_err.text = AppDelegate.tmots.getTxtErr()
            } else {
                self.lab_traduit.text = AppDelegate.tmots.chercherMot(mot_a_chercher)!.get_en_anglais()
            }
            self.str_err.text = "validé avec succés"
        } else {
            // erreur
            self.str_err.text = "erreur champs manquant"
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
