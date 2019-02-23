//
//  CategoriesViewCell.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/6/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit

class CategoriesViewCell: UICollectionViewCell {
    
    @IBOutlet weak var Img2: UIImageView!
    @IBOutlet weak var Title2: UILabel!
    
    var myCat: Categories!{
        
        didSet{
            updateData()
        }
        
    }
    
    
    func updateData(){
        Title2.text = myCat.titleC
        Img2.image = myCat.imagesC
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }

    
    
}
