//
//  SearchViewController.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/21/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var cate = ["Catégorie","Salé","Sucré"]
    
//    var samiha: DetailSearchViewController!
//    var index1 = Int()
//     var index2 = Int()
//     var index3 = Int()
    var details: DetailSearchViewController?
    
    @IBOutlet weak var tableView: UITableView!
    
    let titres = ["coffee","restaurant","fastfood"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

  
    /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchDessertSegue" {
            let index : Int = (tableView.indexPathForSelectedRow?.row)!
            self.details = segue.destination as? DetailSearchViewController
            self.details?.type = titres[index]
           
        }
        if segue.identifier == "searchSaleSegue" {
            let index : Int = (tableView.indexPathForSelectedRow?.row)!
            self.details = segue.destination as? DetailSearchViewController
            self.details?.type = titres[index]
            
        }
        
        if segue.identifier == "searchSucreSegue" {
            let index : Int = (tableView.indexPathForSelectedRow?.row)!
            self.details = segue.destination as? DetailSearchViewController
            self.details?.type = titres[index]
            
        }
        
        
    
    }*/
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return cate[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cate.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! subClass
            
            
            print("cell 0");
            
            // Set up cell.label
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! CategoriesTableViewCell
            // Set up cell.button
            print("cell 1");
            return cell
        }else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3") as! TopRatedTableViewCell
            // Set up cell.button
            print("cell 2");
            return cell
        }
        
      
        
        
        return UITableViewCell()
    }
    /*
     switch (indexPath.section) {
     case 0:
     
     let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! subClass
     return cell
     
     default:
     
     let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! CategoriesTableViewCell
     return cell2
     
     }
     
     */
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        let index : Int = (indexPath.row)
        let type = titres[index]
        
        let storyboard = self.storyboard!
        let destination = storyboard.instantiateViewController(withIdentifier: "detailSearchViewControllerId") as! DetailSearchViewController
        destination.type = type
        navigationController?.pushViewController(destination, animated: true)
        print("clicked")
        
        
    }
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130;
    }

    

}



