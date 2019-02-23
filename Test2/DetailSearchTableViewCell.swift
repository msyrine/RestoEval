//
//  DetailSearchTableViewCell.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/21/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit

class DetailSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewDetailSearchTableCell: UIImageView!
    
    @IBOutlet weak var NameRestoDetailSearchTableCell: UILabel!
    
   
    @IBOutlet weak var adresse: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
