//
//  tableTableViewController.swift
//  yellowBus
//
//  Created by Hariom Palkar on 16/02/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import UIKit

func numberOfSectionsInTableView(tableView: UITableView) -> Int {

return 1

}
class tableTableViewController: UITableViewController {

    var busNo = ["TN 11 C 1234","TN 11 C 4566","TN 11 BB 5469","TN 39 V 5995","TN 11 U 9999 ","TN 11 C 3939","TN 11 J 9900","TN 11 C 9393"]
    var busTime = ["6.10","7.20","7.35","7.55","8.10","10.10","3.10","4.10"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 100
        return busNo.count
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as! UIbusTableViewCell
       
        let busTitle = busNo[indexPath .row]
        let busTiming = busTime[indexPath .row]
        

        cell.busNo.text=busTitle
       
        cell.busTime.text=busTiming

        return cell
     
        
    }


   override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
   {
       // 1
    let remindAction = UITableViewRowAction(style: .normal, title: "Remind Me ⏰" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
       // 2
        
        let remindMenu = UIAlertController(title: nil, message: "Set an Reminder for  \(self.busTime[indexPath .row]) ", preferredStyle: .actionSheet)
       // set alaram code
       let alramAction = UIAlertAction(title: "Set Reminder", style: .default, handler: nil)
               let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    
       remindMenu.addAction(alramAction)
        
       remindMenu.addAction(cancelAction)
       
       self.present(remindMenu, animated: true, completion: nil)
       })
     
       return [remindAction]
   }
      
}
