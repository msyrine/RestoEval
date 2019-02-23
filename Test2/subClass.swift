//
//  subClass.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/6/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit

class subClass: UITableViewCell {

    var dessert = Dessert.createCategory()
  //  var myViewController: SearchViewController
    
    @IBOutlet weak var collectionView: UICollectionView!
    var index = Int()
    
    
    
    
}
extension subClass:UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dessert.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DesertCell", for: indexPath) as! DessertViewCell
        myCell.myDessert = dessert[indexPath.row]
        index = indexPath.row
        
        return myCell
    }
    
    
 
   // func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
       //let vc = storyboard.instantiateViewController(withIdentifier: "id") as! DetailSearchViewController
       // let cell: subClass = collectionView.cellForItem(at: indexPath) as! subClass
     //   cell.myViewController.navigationController?.pushViewController(vc, animated: true)
        // UINavigationController.pushViewController(vc)
        //self.present(vc!, animated: true, completion: nil)
    
       // let destination = DetailSearchViewController() // Your destination
    //    SearchViewController.navigationController?.pushViewController(destination, animated: true)
    
    
   // }
    
           
    
}
