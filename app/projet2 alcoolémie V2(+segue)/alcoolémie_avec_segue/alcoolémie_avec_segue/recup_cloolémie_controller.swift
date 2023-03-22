//
//  recup_cloolémie_controller.swift
//  alcoolémie_avec_segue
//
//  Created by Felix Ton that-Lavarini on 22/03/2023.
//

import UIKit

class recup_cloole_mie_controller: UIViewController {

    
    
    // prises (utuliser comme nom dans els variable Field si
    // c'est un field (pour les identifiers)
    @IBOutlet weak var poids: UITextField!
    @IBOutlet weak var deg: UITextField!
    @IBOutlet weak var nbverres: UITextField!
    @IBOutlet weak var sexe: UISegmentedControl!
    // affichage du résultat (contenu)
    @IBOutlet weak var sortie: UILabel!
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        
        // Pass the selected object to the new view controller.
    }
    

}
