//
//  LesSkieurs.swift
//  projet 8 aintrainementCC
//
//  Created by Felix Ton that-Lavarini on 11/04/2023.
//

import Foundation
// prétexte pour décoder/coder écrire en JSON
class LesSkieurs{
    public static func ecritureJSON(_ tousLesSkieurs: [Skieur]){
        let adr  = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("Engelbarg-2022.json")
        let DS = try? JSONEncoder().encode(tousLesSkieurs)
        FileManager.default.createFile(atPath: adr.path, contents: DS, attributes: nil)
        exit(0) // on quitte l'application
    }
    public static func chargementJSON()->[Skieur]{
        var tab : [Skieur] = []
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("Engelbarg-2022.json")
        if FileManager.default.fileExists(atPath: url.path){
            tab = self.loadJson(uneURL: url)!
        }
        return tab
    }
    private static func loadJson(uneURL: URL)->[Skieur]?{
        do {
            let data = try Data(contentsOf: uneURL)
            let decoder = JSONDecoder()
            let tousLesSkieurs = try decoder.decode([Skieur].self, from: data)
            return tousLesSkieurs
        } catch {
            print("error : \(error)")
        }
        return nil
    }
    
    
}
