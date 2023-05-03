//
//  AjouterEleveViewController.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 27/04/2023.
//

import UIKit



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



class AjouterEleveViewController: UIViewController {
    
    
    // inputs "prises"
    /// controle le nombre d'absences

    @IBOutlet weak var modifNbAbsSteppers: UIStepper!
    @IBOutlet weak var nbOutAbsences: UITextField!
    
    @IBOutlet weak var NomIN: UITextField!
    @IBOutlet weak var PrenomIN: UITextField!
    @IBOutlet weak var DateNaissanceIN: UIDatePicker!
    @IBOutlet weak var numEtudiantIN: UITextField!
    @IBOutlet weak var AddInfoIN: UITextField!
    
    @IBOutlet weak var classeIN: UITextField!
    
    
    
    
    
    // sys variables
    private var interneNbAbsence : Int = 0
    
    /// sur le chargement de la view
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    

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
    
    // prend les données en entrée(s) et renvoie un objet élève
    private func charge()->Eleve{
        let rien : String = "pas renseigné"
        let ageEleve : TimeCodable
        let res : Eleve
        
        // d'abord on extrait les données pour les mettres la ou on veut et ensuite on les ajooute dans l'objet eleve
        ageEleve = TimeCodable(self.DateNaissanceIN.date)
        
        
        res = Eleve(self.NomIN.text ?? rien,
                    self.PrenomIN.text ?? rien,
                    ageEleve,
                    self.classeIN.text ?? rien,
                    Int(self.numEtudiantIN.text ?? "0")!,
                    self.interneNbAbsence,
                    self.AddInfoIN.text ?? "")
        
        return res
    }
    
    /// envoie les données dans l'app delegate (en ajoutant un groupe d'élève)
    @IBAction func submit() {
        // sauvegarde des données + mise a jour de la liste d'objets swift
        
    }
    
    
    /// quand on entre une valeur au field
    @IBAction func btnNbAbsEntered(_ sender: UITextField) {
        // le texte est vide
        if (self.nbOutAbsences.text == ""){
            // on met la value du stepper dedans
            self.nbOutAbsences.text = "\(self.interneNbAbsence)"
        } else {
            // on analyse que l'entrée est correcte
            if (Tools.containsOnlyInt(self.nbOutAbsences.text!)){
                // on copie en stockage et on duplique la valeur
                self.interneNbAbsence = Int(self.nbOutAbsences.text!)!
                self.modifNbAbsSteppers.value = Double(self.nbOutAbsences.text!)!
            } else {
                print("ce n'est pas une entrée valide")
            }
        }
    }
    
    /// met a jour la valeur du UIstepper et la met en sortie
    @IBAction func updateStepperValueOnclick(_ sender: UIStepper) {
        self.interneNbAbsence = Int(sender.value)
        self.nbOutAbsences.text = "\(Int(self.modifNbAbsSteppers.value))"
    }
    
    // problème a résoudre -> si ma chaine est vide et que je clique sur le
    // stepper bah la condition if on ne rentre même pas dedans et on rentre dans le suivant


}
