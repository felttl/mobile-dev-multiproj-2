//
//  Ajouter_Evenement_VC.swift
//  TD4 fichier JSON
//
//  Created by Felix Ton that-Lavarini on 28/03/2023.
//

import UIKit

class Ajouter_Evenement_VC: UIViewController {

    
    // prises (outlet)
    @IBOutlet weak var Titre: UITextField!
    @IBOutlet weak var Lieu: UITextField!
    @IBOutlet weak var Début: UITextField!
    @IBOutlet weak var Durée: UITextField!
    
    
    // récupération
    private var titre : String
    private var lieu : String
    private var début : String
    private var durée : String
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // on canceling
    @IBAction func cancel(_ sender: UIButton) {
        self.Titre.text! = ""
        self.Lieu.text! = ""
        self.Début.text! = ""
        self.Durée.text! = ""
    }
    
    // validate form
    @IBAction func add_event(_ sender: Any) {
        
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
