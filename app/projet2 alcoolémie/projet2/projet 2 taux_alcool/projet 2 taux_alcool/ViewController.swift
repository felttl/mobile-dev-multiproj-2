//
//  ViewController.swift
//  projet 2 taux_alcool
//
//  Created by Felix Ton that-Lavarini on 14/03/2023.
//



/*
 
 shortcuts :
 { = alt opt + 5
 [ = maj + alt opt + 5
 \ = alt opt + maj + /

 */
import UIKit

class ViewController: UIViewController {
    
        // prises (utuliser comme nom dans els variable Field si
        // c'est un field (pour les identifiers)
        @IBOutlet weak var poids: UITextField!
        @IBOutlet weak var deg: UITextField!
        @IBOutlet weak var nbverres: UITextField!
        @IBOutlet weak var sexe: UISegmentedControl!
        // affichage du résultat (contenu)
        @IBOutlet weak var sortie: UILabel!
    
    
    // notre gestion
    private var opoids : Double = 0
    private var overres : Int = 0
    private var odeg : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // récupérération des données au touché du clique
    private func calculer_taux(_ lepoids:Double, _ laqte:Int, _ deg:Double, _ sexe:Int)->Double{
        var taux : Double = 0.0
        var coeff : Double = 0.0
        coeff = (sexe == 1) ? 0.7 : 0.6
        taux = Double(laqte)*10*(deg/100)*0.8/lepoids*coeff
        return taux
    }
    // affichage aprés soumission
    @IBAction func submit(_ sender: UIButton) {
        var result : Double
        var label_sortie = self.sortie.text
        // in résoud les problème si la personne ne saisit rien
        if  let rec_poids = Double(self.poids.text!),
            let rec_nb_verres = Int(self.nbverres.text!),
            let rec_deg = Double(self.deg.text!),
            let rec_sexe = self.sexe.selectedSegmentIndex {
            // on fais le calcul
            result = self.calculer_taux(rec_poids, rec_nb_verres, rec_deg, rec_sexe)
            // on insère les données dans l'affichage de sortie
            label_sortie = "taux : \(result)"
        } else {
            label_sortie = "Erreur : impossible de faire le calcul"
        }
    }
    
    
    

}

