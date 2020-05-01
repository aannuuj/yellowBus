//
//  ScheduleCell.swift
//  yellowBus
//
//  Created by Hariom Palkar on 25/04/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import UIKit

class ScheduleCell: UITableViewCell {
    
    @IBOutlet weak var busImage: UIImageView!
    @IBOutlet weak var busNo: UILabel!
    @IBOutlet weak var busRegNo: UILabel!
    @IBOutlet weak var busTime: UILabel!
    
    override func awakeFromNib() {
          super.awakeFromNib()
        
      }
}

