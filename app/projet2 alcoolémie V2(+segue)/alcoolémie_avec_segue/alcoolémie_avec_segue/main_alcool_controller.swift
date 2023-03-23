//
//  main_alcool_controller.swift
//  alcoolémie_avec_segue
//
//  Created by Felix Ton that-Lavarini on 22/03/2023.
//

import UIKit

/*
 rappel :
 
 
 CameCase = nom de variable séparées par
 des majuscules (pas par des underscore)
 
 */

class main_alcool_controller: UIViewController {

    // dernière version du projet supprimé (il y a six jours)
    // le merge a échoué
    
    
    // prises (utuliser comme nom dans els variable Field si
    // c'est un field (pour les identifiers)
    @IBOutlet weak var sexe: UISegmentedControl!
    @IBOutlet weak var poids: UITextField!
    @IBOutlet weak var nbverres: UITextField!
    @IBOutlet weak var deg: UITextField!
    @IBOutlet weak var sortie: UILabel!
    // notre gestion
    private var opoids : Double = 0
    private var overres : Int = 0
    private var odeg : Float = 0
    
    // resultat pour la segue 2 :
    public var result_tx : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    // récupérération des données au touché du clique
    private func calculer_taux(_ lepoids:Double, _ laqte:Int, _ deg:Double, _ sexe:Int)->Double{
        var taux : Double = 0.0
        var coeff : Double = 0.0
        coeff = (sexe == 1) ? 0.7 : 0.6
        taux = Double(laqte)*10*(deg/100)*0.8/lepoids*coeff
        return taux
    }
    
    // action lorsque le bouton est cliqué (prise avec calculer)
    @IBAction func submit(_ sender: UIButton) {
        var label_sortie = self.sortie.text
        // in résoud les problème si la personne ne saisit rien
        let rec_sexe = self.sexe.selectedSegmentIndex
        if  let rec_poids = Double(self.poids.text!),
            let rec_nb_verres = Int(self.nbverres.text!),
            let rec_deg = Double(self.deg.text!){
            // on fais le calcul
            self.result_tx = self.calculer_taux(rec_poids, rec_nb_verres, rec_deg, rec_sexe)
            // on insère les données dans l'affichage de sortie
            label_sortie = "taux : \(self.result_tx)"
        } else {
            label_sortie = "Erreur : impossible de faire le calcul"
        }
        performSegue(withIdentifier: "recupViewController", sender: nil)
    }
    

    //
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "affichesecondcontroller"){
            // on trastype vers la classe de niveau plus haut
            let recupViewController = segue.destination as! recupViewController
            // on insére les données pour la segue suivante :
            recupViewController.recupLab.text = "\(self.result_tx)"
        }
    }
    

}
