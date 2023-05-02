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
    @IBOutlet weak var modifierNbAbsences: UIStepper!
    @IBOutlet weak var nbOutAbsences: UITextField!
    
    @IBOutlet weak var NomIN: UITextField!
    @IBOutlet weak var PrenomIN: UITextField!
    @IBOutlet weak var DateNaissanceIN: UIDatePicker!
    @IBOutlet weak var numEtudiantIN: UITextField!
    @IBOutlet weak var AddInfoIN: UITextField!
    
    @IBOutlet weak var classeIN: UITextField!
    
    
    
    
    
    // sys variables
    private var lastNbAbsence : Int = 0
    
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
                    self.lastNbAbsence,
                    self.AddInfoIN.text ?? "")
        
        return res
    }
    
    /// envoie les données dans l'app delegate (en ajoutant un groupe d'élève)
    @IBAction func submit() {
        // sauvegarde des données + mise a jour de la liste d'objets swift
        
    }
    
    
    /// met a jour la valeur du UIstepper et la met en sortie
    @IBAction func updateStepperValueOnclick() {
        // si j'arrive a récupérer une variable int je le fais sinon je met la dernière variable valide dedans
        if (self.nbOutAbsences.text != nil){
            // si c'est une entrée valable
            if (Tools.containsOnlyInt(self.nbOutAbsences.text!)){
                self.lastNbAbsence = Int(self.nbOutAbsences.text!)!
                self.modifierNbAbsences.value = Double(self.nbOutAbsences.text!)!
            } else {
                print("ce n'est pas une entrée valide")
            }
            //on met la valeur récupérée dans le nombre de personnes sauvés
            self.lastNbAbsence = Int(self.nbOutAbsences.text ?? "0") ?? 0
        } else {
            // sinon on met le nombre de personnes sauvés dans le stepper value
            self.nbOutAbsences.text = "\(self.lastNbAbsence)"
            // on syncronise le stepper et le field
            self.modifierNbAbsences.value = Double(self.lastNbAbsence)
        }
        self.nbOutAbsences.text = String(self.lastNbAbsence)
    }
    
    // problème a résoudre -> si ma chaine est vide et que je clique sur le
    // stepper bah la condition if on ne rentre même pas dedans et on rentre dans le suivant


}
