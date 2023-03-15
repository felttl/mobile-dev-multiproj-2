//
//  LesEvenements.swift
//  TD3 Agenda
//
//  Created by Felix Ton that-Lavarini on 15/03/2023.
//

import Foundation


class LesEvenements {
    //L1 NEC Mobiles TD3 Page 2 sur 4
    // variables :
    private static var tab : [Evenement]=[]
    
    
    public static func getTous() ->[Evenement]{
        return LesEvenements.tab
    }
    public static func créerLesEvenements(){
        //Création des objets de la classe Evénements puis ajout
        LesEvenements.tab.append(Evenement("Petit dejeuner", "atrium", "", 30))
        LesEvenements.tab.append(Evenement("Programmez votre avenir", "Amphi", "", 60))
        LesEvenements.tab.append(Evenement("Avec classe !", "Amphi", "", 60))
        LesEvenements.tab.append(Evenement("Dejeuner", "atrium", "", 120))

    }

}







// end page
