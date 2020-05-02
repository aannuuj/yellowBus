//
//  schViewController.swift
//  yellowBus
//
//  Created by Hariom Palkar on 01/05/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import UIKit
var busDetail = BusDetails()

class schViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // adding data source and delegate to tableview
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //slider row action
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let remindAction = UITableViewRowAction(style: .normal, title: "⏰" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
            
            let remindMenu = UIAlertController(title: nil, message: "Set an ⏰ Reminder for  \( busDetail.busNo[indexPath .row]) ", preferredStyle: .actionSheet)
            let alramAction = UIAlertAction(title: "Set Reminder  \(busDetail.busTime[indexPath .row])", style: .default, handler: { action in busDetail.setAlarm()})
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            remindMenu.addAction(alramAction)
            remindMenu.addAction(cancelAction)
            self.present(remindMenu, animated: true, completion: nil)
        })
        return [remindAction]
    }
    
    
    // MARK: - UITableView Delegates & Data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 100 // sell height
        return busDetail.busNo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as! UIbusTableViewCell
        let busTitle = busDetail.busNo[indexPath .row]
        let busTiming = busDetail.busTime[indexPath .row]
        cell.busNo.text=busTitle
        cell.busTime.text=busTiming
        return cell
    }
}
