//
//  AjouterEleveViewController.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 27/04/2023.
//

import UIKit

class AjouterEleveViewController: UIViewController {
    
    
    // inputs "prises"
    /// controle le nombre d'absences
    @IBOutlet weak var modifierNbAbsences: UIStepper!
    @IBOutlet weak var nbOutAbsences: UITextField!
    
    private var lastNbAbsence : Int = 0
    
    /// sur le chargement de la view
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
//    private var Nom : String?
//    private var Prenom : String?
//    private var Age : TimeCodable?
//    private var Classe : String?
//    private var Numero : Int?
//    private var Color : Float = 0 // gradient de couleur pour savoir si il est souvent la ou non
//    private var ABSIntervalle : [Int] = [0, 20] // 20 absence par mois élevé
//    private var Notes : [Float]
//    private var nbAbsences : Int = 0  // But de l'application
//    private var InfosPlus : String? // stockAge commentaires

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    /// permet d'ajouter dirrectement le fichier avec tout les élèves dans l'application
    @IBAction func ajouterEleveListe(_ sender: Any) {
        // charge les données
    }
    
    
    
    
    /// met a jour la valeur du UIstepper et la met en sortie
    @IBAction func updateStepperValueOnclick(_ sender: UIStepper) {
        // si j'arrive a récupérer une variable int je le fais sinon je met la dernière variable valide dedans
        if (self.nbOutAbsences.text != nil){
            //on met la valeur récupérée dans le nombre de personnes sauvés
            self.lastNbAbsence = Int(self.nbOutAbsences.text!)!
        } else {
            // sinon on met le nombre de personnes sauvés dans le stepper value
            self.modifierNbAbsences.value = Double(self.lastNbAbsence)
        }
        self.nbOutAbsences.text = String(self.lastNbAbsence)
    }


}
