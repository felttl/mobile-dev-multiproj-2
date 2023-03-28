//
//  ViewController.swift
//  TD2 frais de déplacement
//
//  Created by Felix Ton that-Lavarini on 16/03/2023.
//

import UIKit

class ViewController: UIViewController {

    // infos utilisateur (prises)
    @IBOutlet weak var nb_chevaux: UITextField!

    @IBOutlet weak var choix_ville: UISegmentedControl!
    @IBOutlet weak var sortie_display: UILabel!
    @IBOutlet weak var nb_kms: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    private func calculer_prix(_ nb_chevaux:Int, _ kms: Float,_ choix_ville:Int)->Float{
        var res : Float
        res = (choix_ville == 0) ? 110 : (choix_ville == 1) ? 90 : 70
        
        print(res)
        
        return res
    }
    
    
    
    
    // code que l'on doit fournir
    @IBAction func tapSurBtnCalculer(_ sender: Any) {
        // code
        // parties non remplies :
        if (self.nb_chevaux == nil || self.nb_kms == nil){
            self.sortie_display.text = "erreur de saisie !!"
        } else {
            var result = self.calculer_prix(
                Int(self.nb_chevaux.text!)!,
                Float(self.nb_kms.text!)!,
                self.choix_ville.selectedSegmentIndex)
            self.sortie_display.text = "\(result)"
        }
        
    }
    
    
    
    
    

}

