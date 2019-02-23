//
//  TopRatedViewCell.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/7/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit


class TopRatedViewCell: UICollectionViewCell {
    
    
    
    
    
    @IBOutlet weak var Img3: UIImageView!
    @IBOutlet weak var Title3: UILabel!
    var test = false
    
    var myTop: TopRated!{
        
        didSet{
            updateData()
        }
        
    }
    
    
    func updateData(){
        Title3.text = myTop.titleTop
        Img3.image = myTop.imagesTop
           }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
    

       
    
}
