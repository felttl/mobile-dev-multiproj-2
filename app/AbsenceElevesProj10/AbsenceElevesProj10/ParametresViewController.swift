//
//  ParametresViewController.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 03/05/2023.
//

import UIKit

class ParametresViewController: UIViewController {

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
    
    
    /// trie les élève de chaque classe(s) par leurs nom
    @IBAction func trierParNomEleves() {
        // attention ça le sera pas trié par nom de a a z pour chaque classe
        AppDelegate.leGroupeDEleves.trieParNomAtoZ()
    }
    
    
    

}
