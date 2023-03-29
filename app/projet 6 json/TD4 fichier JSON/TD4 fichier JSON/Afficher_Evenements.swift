//
//  Afficher_Evenements.swift
//  TD4 fichier JSON
//
//  Created by Felix Ton that-Lavarini on 29/03/2023.
//

import UIKit

class Afficher_Evenements: UIViewController {

    public var Les_Evenements : [Evenement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // afichage un par un ?
        for evenement in self.Les_Evenements{
            
        }
        
        override func numberOFSections()->Int{
            return Les_Evenements.count
            
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
