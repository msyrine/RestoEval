//
//  PostHeaderCell.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/22/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    
 
    
    
    var post: Offre! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        profileImageView.image = post.createdBy.profileImage
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2.0
        
        profileImageView.layer.masksToBounds = true
        
        
        
        userNameLabel.text = post.createdBy.username
          }
}
