//
//  ViewController.swift
//  yellowBus
//
//  Created by Hariom Palkar on 05/02/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let segmentedControl : UISegmentedControl = {
     let sc = UISegmentedControl(items: ["Live","Schedule"])
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let tableView = UITableView(frame: .zero, style: .plain)
    let live = [
    "Bus1","Bus2","Bus 2"]
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Shuttle Bus"
        let stackView = UIStackView(arrangedSubviews: [
        segmentedControl, tableView
        ])
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor,  padding: .zero)
        
        // Do any additional setup after loading the view.
    }


}

