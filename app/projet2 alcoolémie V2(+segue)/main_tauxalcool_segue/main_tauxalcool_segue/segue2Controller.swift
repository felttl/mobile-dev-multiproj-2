//
//  segue2Controller.swift
//  main_tauxalcool_segue
//
//  Created by Felix Ton that-Lavarini on 24/03/2023.
//

import UIKit

class segue2Controller: UIViewController {

    // récupère la donnée de la segue principale
    @IBOutlet weak var recupLab: UILabel!
    // public car pas de méthodes pour récupérer cette variable autrement
    public var recupAlcoolTX : Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // met la valeur transmise dans la chaine
        // (TRANSITION OBLIGATOIRE)
        self.recupLab.text = String(self.recupAlcoolTX)
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

}
