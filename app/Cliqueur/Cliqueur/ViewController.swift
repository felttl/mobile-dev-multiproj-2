//
//  ViewController.swift
//  Cliqueur
//
//  Created by Felix Ton that-Lavarini on 10/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    // mettre en forme le textes
    @IBOutlet weak var txtnbdpers: UITextField!
    

    // pouvoir afficher le nb de personnes sur l'ecran
    @IBOutlet weak var nb_pers_msg: UILabel!
    @IBOutlet weak var incr_button_pers: UIStepper!

    // compte le nombre de personnes (défaut 0)
    private var nb_pers : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.incr_button_pers.stepValue = 1
        self.incr_button_pers.autorepeat = true
        self.incr_button_pers.minimumValue = 0.0
        // au début on affiche la valeur initialisé :
        self.nb_pers_msg.text = "\(self.nb_pers)"
    }
    
    // ç ça va pas il faut faire avec la prise !!!
    @IBAction func button_background_color(){
        self.txtnbdpers.backgroundColor = UIColor.red
    }
    
    // en fonction de l'action augmente le nombre de
    // personne ou non (modifie le nombre de personnes)s
    @IBAction func update_nbpers(_ sender: UIStepper) {
        self.nb_pers += Int(sender.stepValue)
        
    }
    

}

