//
//  SearchRestoViewController.swift
//  Test2
//
//  Created by Methlouthi Syrine on 1/9/18.
//  Copyright © 2018 Methlouthi Syrine. All rights reserved.
//

import UIKit

class SearchRestoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    // array names 3 array
    var cat = [String]()
    var sale = [String]()
    var sucre = [String]()
    // array tsawer 3 array
    var catPhoto = [String]()
    var salePhoto = [String]()
    var sucrePhoto = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 1
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionCell", for: indexPath)        
        
        return myCell
        
    }


    
   }
