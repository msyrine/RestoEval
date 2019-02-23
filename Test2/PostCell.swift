//
//  PostCell.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/22/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    
    @IBOutlet weak var postImageView: UIImageView!
    
    
    
    @IBOutlet weak var numberOfLikesButton: UIButton!
    
    
    @IBOutlet weak var postCaptionLabel: UILabel!
    
    
    
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    var post: Offre! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        self.postImageView.image = post.image
        
        postCaptionLabel.text = post.caption
        
        timeAgoLabel.text = post.timeAgo
        
        
        
        numberOfLikesButton.setTitle("❤︎ " + String(describing: post.numberOfLikes) + " Likes", for: [])
        
    }

}
