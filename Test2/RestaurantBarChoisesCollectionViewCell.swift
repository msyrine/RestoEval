//
//  RestaurantBarChoisesCollectionViewCell.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/13/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit
protocol selectionProtocol {
    func selected(choice : String)
}
class RestaurantBarChoisesCollectionViewCell: UICollectionViewCell {
    
    var delegate : selectionProtocol!
    @IBOutlet weak var TitleBarChoises: UILabel!
    
    @IBAction func touchMK(_ sender: Any) {
        self.delegate.selected(choice: TitleBarChoises.text!)
    }
    
}
