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
    
    // code que l'on doit fournir
    @IBAction func tapSurBtnCalculer(_ sender: Any) {
        // code
        var result : Float = 0.0
        result += self.choix_ville.
        self.sortie_display.text = "\(result)"
    }
    
    
    
    
    

}

