//
//  Version_View_Controller.swift
//  projet_fin_global
//
//  Created by Felix Ton that-Lavarini on 06/04/2023.
//

import UIKit

class Version_View_Controller: UIViewController {

    
    // prises
    @IBOutlet weak var show_word: UILabel!
    @IBOutlet weak var input_word: UITextField!
    @IBOutlet weak var output_word: UILabel!
    // erreurs/error
    @IBOutlet weak var err: UILabel!
    // liste des mots déja vus : (leurs positions, cc'est plus simple)
    private var déja_vu : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // charge un mot aléatoire
        self.get_random_input()
        // Do any additional setup after loading the view.
    }
    
    // pour savoir si la position d'un entier de la liste des index des mots
    // à déja été affiché ou non (faux = pas choisi et vrai déja choisi)
    private func deja_choisi(_ cherch_int: Int)->Bool{
        var res : Bool = false
        var cpt : Int = 0
        while (!res && cpt < self.déja_vu.count){
            if (self.déja_vu[cpt] == cherch_int){
                res = !res
            }
            cpt += 1
        }
        return res
    }
    
    
    // get new word
    @IBAction func reload() {
        self.get_random_input()
    }
    
    
    
    // va chercher un mot aléatoire de laliste des mots et
    // le renvoyer ... ( + système de gestion des errreurs)
    public func get_random_input(){
        var max_l = AppDelegate.tmots.tousLesMots.count
        
        if (self.déja_vu.count == max_l){
            self.err.text = "vous avez déja saisi tout les mots de la liste"
        }else if (max_l == 0){
            self.err.text = "la liste de mots est vide (errreur système) !"
        } else {
            self.err.text = ""
            var mot_choisi = Int.random(in: 0...max_l-1)
            while (self.deja_choisi(mot_choisi)){
                mot_choisi = Int.random(in: 0...max_l-1)
            }
            self.show_word.text = AppDelegate.tmots.tousLesMots[mot_choisi].get_en_anglais()
            self.déja_vu.append(mot_choisi)
        }
    }
    
    
    // affiche le résultat
    @IBAction func on_verif() {
        // saisie non vide :
        if (self.input_word.text != nil){
            // on traduit du français vers l'anglaisou l'inverse ?
            var le_mot : Mot = Mot(self.input_word.text!, "")
            if(AppDelegate.tmots.chercherMot(le_mot) != nil){
                self.output_word.text = AppDelegate.tmots.chercherMot(le_mot)!.get_en_français()
            }
            self.err.text = AppDelegate.tmots.getTxtErr()
            // si déja affiché une erreur
        } else {
            self.err.text = "erreur"
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
