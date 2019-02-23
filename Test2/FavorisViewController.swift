//
//  FavorisViewController.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/21/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit
import Alamofire

class FavorisViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static let leftAndRightPaddings: CGFloat = 2.0
    static let numberOfItemsPerRow: CGFloat = 3.0
    
    
    var imagesFavorisResto = [String]()
     var nameFavorisResto = [String]()
    let urlAddFav = "http://172.16.4.125/FarguitaServer/addfavoris.php"
     let urlGetFav = "http://172.16.4.125/FarguitaServer/getfavoris.php"
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        imagesFavorisResto = ["1.png","2.png","x1.png","x2.png","x3.png","x4.png"]
//        nameFavorisResto = ["resto 1","resto 2","resto 3","resto 4","resto 5","resto 6"]

//        Alamofire.request(urlGetFav).responseJSON { responsep in
//            if(responsep.result.isSuccess){
//                let dictp = responsep.result.value! as? Dictionary<String, AnyObject>
//                for dic in (dictp!){
//                    let titre = dic["placeTitle"]! as! String
//                    let photo = dic["photo"]! as! String
//                    let id = dic["placeId"]! as! String
//                }
//            }else
//            {
//            }}
        
        
        

        let collectionViewWidth = collectionView?.frame.width
        let itemWidth = (collectionViewWidth! - FavorisViewController.leftAndRightPaddings) / FavorisViewController.numberOfItemsPerRow
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        
        // Do any additional setup after loading the view.
    }

   
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.imagesFavorisResto.count
        
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavorisRestoCell", for: indexPath) as! FavorisCollectionViewCell
        myCell.imageViewCellFavorisResto.image = UIImage(named: self.imagesFavorisResto[indexPath.row])
         myCell.nameRestoFavorisLabel.text = self.nameFavorisResto[indexPath.row]
        
        return myCell

    }
    
    
    
    
    
    

}
