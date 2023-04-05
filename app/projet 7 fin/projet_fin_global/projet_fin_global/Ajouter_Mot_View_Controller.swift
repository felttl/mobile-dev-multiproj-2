//
//  Ajouter_Mot_View_Controller.swift
//  projet_fin_global
//
//  Created by Felix Ton that-Lavarini on 05/04/2023.
//

import UIKit

class Ajouter_Mot_View_Controller: UIViewController {

    // prises
    @IBOutlet weak var mot_fr_field: UITextField!
    @IBOutlet weak var mot_en_field: UITextField!
    
    @IBOutlet weak var err: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func ajouter_mot_btn() {
        // on valoriste tout si tout va bien :
        if (self.mot_en_field.text != nil && self.mot_fr_field.text != nil){
            AppDelegate.mots.append(Mot(self.mot_fr_field.text!, self.mot_en_field.text!))
            self.err.text = ""
        } else {
            self.err.text = "erreur"
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
