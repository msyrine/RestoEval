//
//  SearchTableViewCell.swift
//  Test2
//
//  Created by Medlink on 6/17/18.
//  Copyright © 2018 Methlouthi Syrine. All rights reserved.
//

import UIKit

protocol didNavigateToDetail {
    func didNavigate(contentText : String)
}


class SearchTableViewCell: UITableViewCell, UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

    var delegate : didNavigateToDetail!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var title : String!
    
    var imagesArray : [UIImage]!
    
    var itemArray : [String]?{
        didSet{
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            
            
        }
    }
    


    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height : CGFloat = self.contentView.frame.height - 10
        return CGSize(width: 150,height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.itemArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : Search2CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "1searchCell", for: indexPath) as! Search2CollectionViewCell
        cell.text.text = self.itemArray?[indexPath.row]
        cell.imageView.image = self.imagesArray?[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        delegate.didNavigate(contentText: itemArray![indexPath.row])
        
    }
}
