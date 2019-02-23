//
//  CommentairesRestoTableViewCell.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/19/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit

class CommentairesRestoTableViewCell: UITableViewCell {

    @IBOutlet weak var CommentaireUserCommentaireRestoTableCell: UILabel!
    @IBOutlet weak var nameUserCommentaireRestoTableCell: UIView!
    @IBOutlet weak var imageViewCommentaireRestoUserTableCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
