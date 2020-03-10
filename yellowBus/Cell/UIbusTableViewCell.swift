//
//  UIbusTableViewCell.swift
//  yellowBus
//
//  Created by Hariom Palkar on 05/03/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import UIKit

class UIbusTableViewCell: UITableViewCell {
    
    @IBOutlet weak var busImage: UIImageView!
    
    @IBOutlet weak var busNo: UILabel!
    @IBOutlet weak var busRegNo: UILabel!
    @IBOutlet weak var busTime: UILabel!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        let redView = UIView(frame: bounds)
//        redView.backgroundView = UIimageView(
//        self.backgroundView = imageView
//
//        let blueView = UIView(frame: bounds)
//        blueView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
//        self.selectedBackgroundView = blueView
//    }
}
