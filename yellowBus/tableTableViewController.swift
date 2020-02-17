//
//  tableTableViewController.swift
//  yellowBus
//
//  Created by Hariom Palkar on 16/02/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import UIKit

class tableTableViewController: UITableViewController {

    var Bus = ["Bus 1","Bus2","Bus 1","Bus2","Bus 1","Bus2","Bus 1","Bus2"]
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Bus.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath)
        let schedule = Bus[indexPath.row]
        cell.textLabel?.text = schedule
        return cell
    }


   override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
   {
       // 1
    let shareAction = UITableViewRowAction(style: .default, title: "Remind Me" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
       // 2
        
       let shareMenu = UIAlertController(title: nil, message: "", preferredStyle: .actionSheet)
       // set alaram code
       let alramAction = UIAlertAction(title: "Set Reminder", style: .default, handler: nil)
               let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    
       shareMenu.addAction(alramAction)
       shareMenu.addAction(cancelAction)
       
       self.present(shareMenu, animated: true, completion: nil)
       })
       // 3
      //  let rateAction = UITableViewRowAction(style: .default, title: "Rate" , handler: { (action:UITableViewRowAction, indexPath:IndexPath) -> Void in
       // 4
      //  let rateMenu = UIAlertController(title: nil, message: "Rate this App", preferredStyle: .actionSheet)
               
       // let appRateAction = UIAlertAction(title: "Rate", style: .default, handler: nil)
      //  let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
               
      //  rateMenu.addAction(appRateAction)
     //   rateMenu.addAction(cancelAction)
                
    //    self.present(rateMenu, animated: true, completion: nil)
    //  })
       // 5
       return [shareAction]
   }
      
    
    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
