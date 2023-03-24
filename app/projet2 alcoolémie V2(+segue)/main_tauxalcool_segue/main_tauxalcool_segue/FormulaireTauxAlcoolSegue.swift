//
//  FormulaireTauxAlcoolSegue.swift
//  main_tauxalcool_segue
//
//  Created by Felix Ton that-Lavarini on 24/03/2023.
//

import UIKit

class FormulaireTauxAlcoolSegue: UIViewController {

    
    // prises :
    
    @IBOutlet weak var poids: UITextField!
    @IBOutlet weak var nbverres: UITextField!
    @IBOutlet weak var deg: UITextField!
    @IBOutlet weak var sexe: UISegmentedControl!
    // sortie(s)
    @IBOutlet weak var sortie: UILabel!
    // récupération pour la segue deux
    public var resultTX : Double! = 0
    // sauvegarde pour la réutilisation
    private var opoids : Double! = 0
    private var overres : Int! = 0
    private var odeg : Float! = 0
    // ne pas faire de segue si le formulaire n'est pas saisi
    private var completedForm : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // récupérération des données au touché du clique
    private func calculer_taux(_ lepoids:Double, _ laqte:Int, _ deg:Double, _ sexe:Int)->Double{
        var taux : Double = 0.0
        var coeff : Double = 0.0
        coeff = (sexe == 1) ? 0.7 : 0.6
        taux = Double(laqte)*10*(deg)*0.8/lepoids*coeff
        return taux
    }
    
    // actions onclick
    @IBAction func submit(_ sender: Any) {
        // in résoud les problème si la personne ne saisit rien
        let rec_sexe = self.sexe.selectedSegmentIndex
        if  let rec_poids = Double(self.poids.text!),
            let rec_nb_verres = Int(self.nbverres.text!),
            let rec_deg = Double(self.deg.text!){
            // on fais le calcul
            self.resultTX = self.calculer_taux(rec_poids, rec_nb_verres, rec_deg, rec_sexe)
            // on insère les données dans l'affichage de sortie
            // (attention le string interpolation est une mauvaise pratique) pour debug
            self.sortie.text = "taux : "+String(self.resultTX)
            print("calcul effectué")
        } else {
            self.sortie.text = "Erreur : impossible de faire le calcul"
        }
        // form submited
        self.completedForm = true
        
        //sert a aller dans la segue suivante
        performSegue(withIdentifier: "segue2Controller", sender: nil)

        
    }
    
    
    
    
    
    
    // MARK: - Navigation

    // pour la segue suivante (préparation)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // si la segue que l'on sélectionne aura le bon nom alors on effectue des opérations dessus
        if (segue.identifier == "segue2Controller" && self.completedForm){
            // on trastype vers la classe de niveau plus haut
            let recupViewController = segue.destination as! segue2Controller
            // on insére les données pour la segue suivante :
            recupViewController.recupAlcoolTX = self.resultTX
        }
        
    }
    
     
}
