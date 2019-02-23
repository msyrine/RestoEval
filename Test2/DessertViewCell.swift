//
//  DessertViewCell.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/5/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit

class DessertViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var Title: UILabel!
    
    var myDessert: Dessert!{
        
        didSet{
            updateData()
        }
        
    }
    
    
    func updateData(){
        Title.text = myDessert.title
        Img.image = myDessert.images
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
    
    
    
    
}
