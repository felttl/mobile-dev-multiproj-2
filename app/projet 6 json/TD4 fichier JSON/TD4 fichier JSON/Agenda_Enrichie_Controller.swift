//
//  Agenda_Enrichie_Controller.swift
//  TD4 fichier JSON
//
//  Created by Felix Ton that-Lavarini on 28/03/2023.
//

import UIKit


// initial controller !(main segue)
class Agenda_Enrichie_Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Agenda_Enrichie_Controller"){
            let recupViewController = segue.destination as! Ajouter_Evenement_VC
            recupViewController.titre = ""
            recupViewController.lieu = ""
            recupViewController.début = ""
            recupViewController.durée = ""
            
        }
    }
    

}
