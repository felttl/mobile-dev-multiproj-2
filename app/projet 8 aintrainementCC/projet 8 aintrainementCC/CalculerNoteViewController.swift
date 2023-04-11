//
//  CalculerNoteViewController.swift
//  projet 8 aintrainementCC
//
//  Created by Felix Ton that-Lavarini on 11/04/2023.
//

import UIKit

class CalculerNoteViewController: UIViewController {
    
    public var tabNotes: [Float]=[]
    // prises
    @IBOutlet weak var numDossard: UITextField!
    @IBOutlet weak var nomSkieur: UITextField!
    @IBOutlet weak var noteJuge1: UITextField!
    @IBOutlet weak var noteJuge2: UITextField!
    @IBOutlet weak var noteJuge3: UITextField!
    @IBOutlet weak var noteJuge4: UITextField!
    @IBOutlet weak var noteJuge5: UITextField!
    // sortie
    @IBOutlet weak var tabNoteFinale: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // valorisation du tableau de réels tabNotes à partir des notes données par les 5 juges
    private func recupNote(){
        self.tabNotes.append(Float(noteJuge1.text!)!)
        self.tabNotes.append(Float(noteJuge2.text!)!)
        self.tabNotes.append(Float(noteJuge3.text!)!)
        self.tabNotes.append(Float(noteJuge4.text!)!)
        self.tabNotes.append(Float(noteJuge5.text!)!)
        
    }
    
    // calcul de la note finale et ajout du skieur dans la variable
    // tousLesSkieurs du fichier AppDelegate
    @IBAction func tapSurCalculer() {
        var tempnote : Float = 0
        self.recupNote()
        tempnote = Outils.SommeNotes(self.tabNotes)
        tempnote -= Outils.RechercherMax(self.tabNotes)
        tempnote -= Outils.RechercherMin(self.tabNotes)
        self.tabNoteFinale.text = "\(tempnote)"
        var objSkieur : Skieur = Skieur(Int(self.numDossard.text!)!, self.nomSkieur.text!, tempnote)
        AppDelegate.ajouteUnSkieur(objSkieur)
    }
    

    @IBAction func tapNouveauSkieur() {
        numDossard.text = ""
        nomSkieur.text = ""
        noteJuge1.text = ""
        noteJuge2.text = ""
        noteJuge3.text = ""
        noteJuge4.text = ""
        noteJuge5.text = ""
        tabNotes = []
        tabNoteFinale.text = ""
    }

    
    @IBAction func tapSurEnregistrer() {
        LesSkieurs.ecritureJSON(AppDelegate.getTousLesSkieurs())
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
