//
//  Search2ViewController.swift
//  Test2
//
//  Created by Methlouthi Syrine on 6/17/18.
//  Copyright © 2018 Methlouthi Syrine. All rights reserved.
//

import UIKit

class Search2ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cate = ["What you want","Salty","Swwet"]
    let WhatYouCanEatTitles = ["Breakfast","Lunch","Dinner","Coffee","Bar"]
    let SaltyTitles = ["Salad","Pizza","Tapas","Sushi","Sandwiches"]
    let sweetTitles = ["CheeseCake","Ice Cream","Crepe","Gauffre","Cake"]
    let WhatYouCanEatImages = [#imageLiteral(resourceName: "breakfast"),#imageLiteral(resourceName: "lunch"),#imageLiteral(resourceName: "diner"),#imageLiteral(resourceName: "coffe"),#imageLiteral(resourceName: "bar")]
    let SaltyImages = [#imageLiteral(resourceName: "salad"),#imageLiteral(resourceName: "pizza"),#imageLiteral(resourceName: "tapas"),#imageLiteral(resourceName: "toast"),#imageLiteral(resourceName: "lunch")]
    let SweetImages = [#imageLiteral(resourceName: "cheesecake"),#imageLiteral(resourceName: "glace"),#imageLiteral(resourceName: "crepe"),#imageLiteral(resourceName: "crepe"),#imageLiteral(resourceName: "cake")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }
    
    
}



extension Search2ViewController : UITableViewDelegate, UITableViewDataSource, didNavigateToDetail{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cate.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height : CGFloat = self.view.frame.height/3
        return height
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellRowss") as! SearchTableViewCell
        cell.delegate = self
        switch indexPath.row {
        case 0:
            cell.itemArray = self.WhatYouCanEatTitles
            cell.imagesArray = self.WhatYouCanEatImages
            break
        case 1:
            cell.itemArray = self.SaltyTitles
            cell.imagesArray = self.SaltyImages

            break
        case 2:
            cell.itemArray = self.sweetTitles
            cell.imagesArray = self.SweetImages

            break

        default:
            print("")
        }
        
        return cell
        
    }
    
    func didNavigate(contentText: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : DetailSearch2ViewController = storyboard.instantiateViewController(withIdentifier: "DetailSearch2ViewController") as! DetailSearch2ViewController
        vc.text = contentText
        self.navigationController?.present(vc, animated: true, completion: nil)

    }
    
    
}














//collectionView
//extension Search2ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
//
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return cate.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
//        var countable : Int = 0
//
//        if (section == 0)
//        {
//            print(section)
//            countable = WhatYouCanEatTitles.count
//
//        }else if (section == 1)
//        {
//            print(section)
//
//            countable = SaltyTitles.count
//
//        }else if (section == 2){
//            print(section)
//            countable = sweetTitles.count
//
//        }
//        return countable
//
//    }
//
//
//
//
//
//
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
//    {
//
//        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "1searchCell", for: indexPath) as! Search2CollectionViewCell
//        if(indexPath.section == 0)
//        {
//            // myCell.
//            myCell.text.text = WhatYouCanEatTitles[indexPath.row]
//            myCell.imageView.image = WhatYouCanEatImages[indexPath.row]
//            myCell.contentView.backgroundColor = UIColor.green
//        }
//        if(indexPath.section == 1)
//        {
//            myCell.contentView.backgroundColor = UIColor.yellow
//            // myCell.
//            myCell.text.text = SaltyTitles[indexPath.row]
//            myCell.imageView.image = WhatYouCanEatImages[indexPath.row]
//
//        }
//        if(indexPath.section == 2)
//        {
//            myCell.contentView.backgroundColor = UIColor.blue
//            // myCell.
//            myCell.text.text = sweetTitles[indexPath.row]
//            myCell.imageView.image = WhatYouCanEatImages[indexPath.row]
//
//        }
//
//        return myCell
//
//    }
//
//}






