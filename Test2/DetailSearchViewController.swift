//
//  DetailSearchViewController.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/21/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit
import Alamofire

class DetailSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var type = String()
    var restaurant =  Restaurant()
    
    var titleseg: Dessert!
    var restaurants = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.type = "restaurant"
        let url = "https://api.foursquare.com/v2/venues/search?client_id=YQ23YD2ZQEYATFJMZE5G20XD14UJ1XFNTHYEJOXCMRS2RYS1&client_secret=BWEC3DWTQN5ULIKU00F1UGIF3IPPKX4LXIL151TDS4YZH13W&v=20141215&m=foursquare&query=" + self.type + "&near=tunis,tunisia"
        
        Alamofire.request(url).responseJSON { responsep in
            if(responsep.result.isSuccess){
                let dictp = responsep.result.value! as? Dictionary<String, AnyObject>
                let responseJson = dictp?["response"]! as? Dictionary<String, AnyObject>
        
                let venues = responseJson?["venues"]! as? NSArray
                for v in (venues as! NSArray)
                {
                    
                    let venue = v as! Dictionary<String, AnyObject>
                    self.restaurant.username = venue["name"]! as! String
                    
                    self.restaurant.idResto = venue["id"]! as! String
                    self.restaurant.profileImage = UIImage(named: "1.png")
                    let location = venue["location"]! as! Dictionary<String, AnyObject>
                   if location["state"] != nil
                   {
                  	  self.restaurant.adresse = location["state"]! as! String
                    self.tableView.reloadData()
                    }
                    self.restaurants.append(self.restaurant)
                }
            }else{
            print("no")
            }
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailSearchTableCell", for: indexPath) as! DetailSearchTableViewCell
        print(restaurants[indexPath.row])
        cell.imageViewDetailSearchTableCell.image = restaurants[indexPath.row].profileImage
        cell.NameRestoDetailSearchTableCell.text = restaurants[indexPath.row].username
        cell.adresse.text = restaurants[indexPath.row].adresse
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.restaurants.count)
        return self.restaurants.count
    }
    
    

}
