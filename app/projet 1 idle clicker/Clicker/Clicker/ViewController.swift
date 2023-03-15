//
//  ViewController.swift
//  Clicker
//
//  Created by Felix Ton that-Lavarini on 15/03/2023.
//

import UIKit

class ViewController: UIViewController {

    // incrémenter le nombre de personnes (+ valeurs)
    @IBOutlet weak var steppers_personnes: UIStepper!
    // zone d'affichage
    @IBOutlet weak var txt_nb_pers: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // nombre de personnes est zéro au départ
        steppers_personnes.value = 0
        // pas négatif
        steppers_personnes.minimumValue = 0
        // incrémentation +/-
        steppers_personnes.stepValue = 1
        // rester appuyé change la valeurs+ (augmente vite aprés un certaain temps)
        steppers_personnes.autorepeat = true
    }
    // le bloc qui permet de faire des commande
    // lorsque l'on réalise des actions les cliques vont s'efffectuer ici
    @IBAction func uistepper_event(_ sender: UIStepper) {
        // mettre le nombre dans la sortie
        self.txt_nb_pers.text = "\t\(Int(sender.value))"
    }

    

}

