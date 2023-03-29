//
//  AppDelegate.swift
//  TD4 fichier JSON
//
//  Created by Felix Ton that-Lavarini on 28/03/2023.
//

import UIKit
// @main = @UIApplicationMain
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // stocke tous les évènements (utilisable partout)
    private static var tousLesEvenements: [Evenement]=[]

    // OVERLOADED function
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // on charge les évènements en JSON
        AppDelegate.tousLesEvenements = Les_Evenements.chargementJSON()
        return true
    }
    
    
    // custom functs
    public static func getTousLesEvenements()->[Evenement]{
        return AppDelegate.tousLesEvenements
    }
    public static func ajouterEvenement(_ objEvenement: Evenement){
        AppDelegate.tousLesEvenements.append(objEvenement)
    }
    
    // variable privée donc on fais une fonction pour renvoyer le contenu
    public static func getAllEvents()->[Evenement]{
        return AppDelegate.tousLesEvenements
    }
    
    
    
    
    
    
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

