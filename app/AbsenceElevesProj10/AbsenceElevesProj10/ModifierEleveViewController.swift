//
//  ModifierEleveViewController.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 03/05/2023.
//

import UIKit

class ModifierEleveViewController: UIViewController {

    
    
    
    
    @IBOutlet weak var RechercheNumEtudiant: UITextField!
    @IBOutlet weak var NouveauNumEtudiant: UITextField!
    
    @IBOutlet weak var NouveauNomEtudiant: UITextField!
    @IBOutlet weak var NouveauPrenomEtudiant: UITextField!
    
    @IBOutlet weak var NouveauDateNaissanceEtudiant: UIDatePicker!
    
    
    // afficher les messages d'erreur de saisie
    @IBOutlet weak var MssageErreur: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // au chargement de la page
    }
    

    /// mets a jour les données de l'élève (applique les mises a jour)
    @IBAction func updateEleve() {
        // etape 1 On cherche l'élève
        if (self.RechercheNumEtudiant.text != nil && self.RechercheNumEtudiant.text != ""){
            var idxEleve : Int? = AppDelegate.leGroupeDEleves.ChercherEleve(Int(self.RechercheNumEtudiant.text!)!)
            if (idxEleve == nil){
                // si on a pas trouvé on fais pas de changement et on renvoie un msg
                self.MssageErreur.text = "Eleve Introuvable"
            } else {
                // on remplace si on trouve on renvoie aucun msg
                var unEleve : Eleve
                unEleve = Eleve(
                    self.NouveauNomEtudiant.text,
                    self.NouveauPrenomEtudiant.text,
                    TimeCodable(self.NouveauDateNaissanceEtudiant.date),
                    <#T##Classe: String##String#>,
                    <#T##Numero: Int##Int#>,
                    <#T##nbAbsence: Int##Int#>,
                    <#T##infoPlus: String##String#>)
                AppDelegate.leGroupeDEleves.editEleve(idxEleve!, unEleve)
                self.MssageErreur.text = ""
            }
            self.MssageErreur.text = "le numéro de l'étudiant doit être valide"
        } else {
            
        }
        
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
