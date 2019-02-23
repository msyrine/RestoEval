//
//  Dessert.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/5/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import Foundation
import UIKit

class Dessert {
    
    var title: String!
    var images: UIImage!
    
    init(title:String,images:UIImage){
        self.title = title
        self.images = images
    }

    
    static func createCategory()->[Dessert]{
        
        return[
            Dessert(title:"Breakfast",images:UIImage(named: "breakfast.png")!),
             Dessert(title:"Lunch",images:UIImage(named: "lunch.png")!),
              Dessert(title:"Dinner",images:UIImage(named: "diner.png")!),
               Dessert(title:"Bar",images:UIImage(named: "bar.png")!),
        ]
        
    }
    
}
