//
//  TopRated.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/7/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import Foundation
import UIKit

class TopRated {
    
    var titleTop: String!
    var imagesTop: UIImage!
   
       
    init(title:String,images:UIImage){
        self.titleTop = title
        self.imagesTop = images
    }
    
   
    
    static func createCategory()->[TopRated]{
        
        return[
            TopRated(title:"Cheese Cake",images:UIImage(named: "cheesecake.png")!),
            TopRated(title:"Crepe",images:UIImage(named: "crepe.png")!),
            TopRated(title:"Glace",images:UIImage(named: "glace.png")!),
            TopRated(title:"viennoiserie",images:UIImage(named: "viennoiserie.png")!),
            TopRated(title:"Cake",images:UIImage(named: "cake.png")!),
        ]
        
    }
    
    
}
