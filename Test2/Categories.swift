//
//  Categories.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/6/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import Foundation
import UIKit

class Categories {
    
    var titleC: String!
    var imagesC: UIImage!
    
    init(title:String,images:UIImage){
        self.titleC = title
        self.imagesC = images
    }
    
    
    static func createCategories()->[Categories]{
        
        return[
            Categories(title:"Pizza",images:UIImage(named: "pizza.png")!),
            Categories(title:"Salad",images:UIImage(named: "salad.png")!),
            Categories(title:"Plat",images:UIImage(named: "plat.png")!),
            Categories(title:"Tapas",images:UIImage(named: "tapas.png")!),
        ]
        
    }
    
}
