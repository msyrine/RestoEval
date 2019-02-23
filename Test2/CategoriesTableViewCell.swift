//
//  CategoriesTableViewCell.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/6/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    
    var cat = Categories.createCategories()
    
    @IBOutlet weak var CatCollectionView: UICollectionView!

  
}
extension CategoriesTableViewCell:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cat.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatCell", for: indexPath) as! CategoriesViewCell
        myCell.myCat = cat[indexPath.row]
        return myCell
    }
    
    
}
