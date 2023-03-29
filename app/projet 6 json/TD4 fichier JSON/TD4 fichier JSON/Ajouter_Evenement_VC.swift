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
    public var titre : String = ""
    public var lieu : String = ""
    public var début : String = ""
    public var durée : Int = 0 // en minutes
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // quand on se déplace ici
        // au cas ou le main controller envoie des données ici
        self.Titre.text = self.titre
        self.Lieu.text = self.lieu
        self.Début.text = self.début
        self.Durée.text = String(self.durée)
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
        // les champs sont non vides :
        if (self.Titre != nil ||
            self.Lieu.text != nil ||
            self.Début.text != nil ||
            self.Durée.text != nil){
            // on ajoute un objet Evenement dans la liste des évènements
            // (attention pas encore dans le Json)
            AppDelegate.ajouterEvenement(
                Evenement(String(self.Titre.text!),
                          String(self.Lieu.text!),
                          String(self.Début.text!),
                          Int(self.Durée.text!)!
                )
            )
        }
    }
    
    
    // save + leave
    @IBAction func add_and_leave(_ sender: Any) {
        self.add_event("")
        // on ajoute les données de la classe Les_Evenements dans le fichier JSON
        
        // on quitte
        
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
