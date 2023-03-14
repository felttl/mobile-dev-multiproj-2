//
//  ViewController.swift
//  projet 2 taux_alcool
//
//  Created by Felix Ton that-Lavarini on 14/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
        // prises
        @IBOutlet weak var poids: UITextField!
        @IBOutlet weak var deg: UITextField!
        @IBOutlet weak var nbverres: UITextField!
        @IBOutlet weak var sexe: UISegmentedControl!
        // affiche du résultat (contenu)
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
        coeff = (sexe == 0) ? 0.7 : 0.6
        taux = Double(laqte)*10*deg*0.8/lepoids*coeff
        return taux
    }
    // affichage aprés soumission
    @IBAction func submit(_ sender: UIButton) {
        var result : Double
        result = self.calculer_taux(
            Double(self.poids.text!)!,
            Int(self.nbverres.text!)!,
            Double(self.deg.text!)!,
            self.sexe.selectedSegmentIndex)
        self.sortie.text = "taux : \(result)"
    }
    
    
    

}

