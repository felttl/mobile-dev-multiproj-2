//
//  AffichagesDesElevesTableViewController.swift
//  AbsenceElevesProj10
//
//  Created by Felix Ton that-Lavarini on 27/04/2023.
//

import UIKit

class AffichagesDesElevesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // on syncronise les données des autres tables avec AppDelegate
        
    }

    // MARK: - Table view data source
    /// renvoie le nombre de sections (ici ce seront les noms de classes)
    override func numberOfSections(in tableView: UITableView) -> Int {
        // on affichera la liste des éléves par secotion de nom de "classes"
        return AppDelegate.leGroupeDEleves.getlisteClasses().count
    }
    /// renvoie le nombre de ligne de chaque sections
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.leGroupeDEleves.getlisteEleve().count
    }

    /// ajoute chaque type de données dans les parties correspondantes de chaque cellules
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "affichageDesElevesParClasses", for: indexPath)
        let sections = AppDelegate.leGroupeDEleves.getlisteClasses()
        let lignes = AppDelegate.leGroupeDEleves.getlisteEleve()
        // Configure the cell...
        cell.textLabel?.text = sections[indexPath.section]
        cell.detailTextLabel?.text = lignes[indexPath.row].getAllInfos()
        // colorer la cellule

        
        let laCouleur = lignes[indexPath.row].calcGradientAbsences()
        cell.contentView.backgroundColor = UIColor(
            displayP3Red: CGFloat(Double(laCouleur[0])),
            green: CGFloat(Double(laCouleur[1])),
            blue: CGFloat(Double(laCouleur[2])),
            alpha: CGFloat(Double(laCouleur[3]))
        )
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
