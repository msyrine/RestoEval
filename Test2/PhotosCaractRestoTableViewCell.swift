//
//  PhotosCaractRestoTableViewCell.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/14/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit

class PhotosCaractRestoTableViewCell: UITableViewCell {

    
   
    
    
    @IBOutlet weak var photoLeft: UIImageView!
    
    @IBOutlet weak var photoRight: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        photoLeft.layer.borderWidth = 1
        photoLeft.layer.borderColor = UIColor.gray.cgColor
        
        photoRight.layer.borderWidth = 1
        photoRight.layer.borderColor = UIColor.white.cgColor


        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
    
    
    
   
}
