//
//  TopRatedTableViewCell.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/7/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit

class TopRatedTableViewCell: UITableViewCell {

    
    var top = TopRated.createCategory()
    
    @IBOutlet weak var TopCollectionView: UICollectionView!
    
    
    
    
  
}
extension TopRatedTableViewCell:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return top.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RatedCell", for: indexPath) as! TopRatedViewCell
        myCell.myTop = top[indexPath.row]
        return myCell
    }
    
    
}
