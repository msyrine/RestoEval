//
//  DetailSearch2TableViewCell.swift
//  Test2
//
//  Created by Methlouthi Syrine on 6/22/18.
//  Copyright © 2018 Methlouthi Syrine. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
class DetailSearch2TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewDetailCell: UIImageView!
    
    @IBOutlet weak var nomDetailCell: UILabel!
    
    @IBOutlet weak var addresseDetailCell: UILabel!

    @IBOutlet weak var star1: UIImageView!
    
    
    @IBOutlet weak var star2: UIImageView!
    
    
    
    @IBOutlet weak var star3: UIImageView!
    
    
    @IBOutlet weak var star4: UIImageView!
    
    
    @IBOutlet weak var star5: UIImageView!
    
    var imageUrl : String?{
        didSet{
            Alamofire.request(imageUrl!).responseImage{response in debugPrint(response)
            if let image = response.result.value{
                self.imageViewDetailCell.image = image
            }
        }
            print(self.imageUrl ?? "nothing to show")
        }
    }

}
