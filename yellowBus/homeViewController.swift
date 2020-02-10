//
//  homeViewController.swift
//  yellowBus
//
//  Created by Hariom Palkar on 10/02/20.
//  Copyright © 2020 Hariom Palkar. All rights reserved.
//

import UIKit
import GlidingCollection

class homeViewController: UIViewController, GlidingCollectionDatasource, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = glidingView.expandedItemIndex // Value of expanded section.
        return images[section].count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionCell else { return UICollectionViewCell() }
      let section = glidingView.expandedItemIndex
      let image = images[section][indexPath.row]
      cell.imageView.image = image
      cell.contentView.clipsToBounds = true
      
      let layer = cell.layer
      let config = GlidingConfig.shared
      layer.shadowOffset = config.cardShadowOffset
      layer.shadowColor = config.cardShadowColor.cgColor
      layer.shadowOpacity = config.cardShadowOpacity
      layer.shadowRadius = config.cardShadowRadius
      
      layer.shouldRasterize = true
      layer.rasterizationScale = UIScreen.main.scale
      
      return cell
    }
    
    func numberOfItems(in collection: GlidingCollection) -> Int {
            return items.count
    }
    
    func glidingCollection(_ collection: GlidingCollection, itemAtIndex index: Int) -> String {
        return "– " + items[index]
    }
    
   
    
    @IBOutlet weak var glidingView: GlidingCollection!
    
      fileprivate var collectionView: UICollectionView!
      fileprivate var items = ["gloves", "boots", "bindings", "hoodie"]
      fileprivate var images: [[UIImage?]] = []
      
      override func viewDidLoad() {
        super.viewDidLoad()
        
      }
      


private func setupGlidingCollectionView() {
  glidingView.dataSource = self
  
  let nib = UINib(nibName: "CollectionCell", bundle: nil)
  collectionView = glidingView.collectionView
  collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
    collectionView.delegate = self as? UICollectionViewDelegate
  collectionView.dataSource = self
  collectionView.backgroundColor = glidingView.backgroundColor
}


  
}

