//
//  DetailSearch2ViewController.swift
//  Test2
//
//  Created by Medlink on 6/18/18.
//  Copyright © 2018 Methlouthi Syrine. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailSearch2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var text : String!
    
    var restos: [Restaurant]!
    var restaurants = [Restaurant]()
    var restaurant = Restaurant()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlSearch = "https://api.foursquare.com/v2/venues/search?client_id=GZOXGFYHL3V3B1NTLK5JVH3VCUZ2D523VRS1A2QFRTO5EQLI&client_secret=3LN44Z1TXZK1HZYISKAHNWY2F2ZECAYYSSHWF1UZVABR5AB0&v=20141215&m=foursquare&query="+text+"&near=tunis,tunisia"
        
        
        //  print(url)
        
        Alamofire.request(urlSearch).responseJSON { responsep in
            if(responsep.result.isSuccess){
                let dictp = responsep.result.value! as? Dictionary<String, AnyObject>
                let responseJson = dictp?["response"]! as? Dictionary<String, AnyObject>
                
                let venues = responseJson?["venues"]! as? NSArray
                for v in (venues!)
                {
                    // print(v)
                    
                    let venue = v as! Dictionary<String, AnyObject>
                    //  print(venue["name"]! as? String)
                    self.restaurant.username = venue["name"]! as? String
                    
                    self.restaurant.idResto = venue["id"]! as? String
                    //  print(venue["id"]! as? String)
                    //                    self.restaurant.profileImage = UIImage(named: "1.png")
                    //                    let location = venue["location"]! as! Dictionary<String, AnyObject>
                    //                    if location["state"] != nil
                    //                    {
                    //                        self.restaurant.adresse = location["state"]! as? String
                    //                       //  print(location["state"]! as? String)`
                    //                         self.tableView.reloadData()
                    //
                    //                    }
                    
                    
                    
                    self.getInfoRestaurants(idResto: self.restaurant.idResto!)
                    
                    self.restaurants.append(self.restaurant)
                    
                }
            }else{
                print("no")
            }
            self.tableView.reloadData()
            
        }
        
    }
    
    
    func getInfoRestaurants( idResto: String) -> Void {
        
        // var idResto = idResto
        
        let url = "https://api.foursquare.com/v2/venues/"+idResto+"?client_id=GZOXGFYHL3V3B1NTLK5JVH3VCUZ2D523VRS1A2QFRTO5EQLI&client_secret=3LN44Z1TXZK1HZYISKAHNWY2F2ZECAYYSSHWF1UZVABR5AB0&v=20141215"
        
        
        //  print(url)
        
        Alamofire.request(url).responseJSON { responsep in
            if(responsep.result.isSuccess){
                var venue : Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
                let dictp = responsep.result.value! as? Dictionary<String, AnyObject>
                let responseJson = dictp?["response"]! as? Dictionary<String, AnyObject>
                
                if let vm = responseJson?["venue"]! as? Dictionary<String, AnyObject>{
                    venue = vm
                    if let nm : String = venue["name"]! as? String{
                        self.restaurant.username = nm
                    }
                    if let bestPhoto = venue["bestPhoto"]! as? Dictionary<String, AnyObject> {
                        if let prefix = bestPhoto["prefix"]! as? String {
                            if let suffix = bestPhoto["suffix"]! as? String{
                                let imageUrlString = prefix + "320x192" + suffix
                                print(imageUrlString)
                                self.restaurant.imageResto = imageUrlString
                            }
                            
                        }
                        
                    }
                    
                }
                
                
                
                //                self.load_image(image_url_string: imageUrlString, view:self.imageViewResto)
                //
                //               if venue?["rating"] != nil
                //               {
                //
                //              //  print(venue?["rating"]!)
                //                self.restaurant.rate = (venue?["rating"]! as! Float )/2
                //               // print(self.restaurant.rate)
                //              //  print("/******************/")
                //
                //                }
                //
                //lat
                
                
                //lng
                
                
                // Heures
                if venue["hours"] != nil
                {
                    let hours = venue["hours"]! as! Dictionary<String, AnyObject>
                    let timeFrames = hours["timeframes"]! as! NSArray
                    let timeframesgroup = timeFrames[0] as! Dictionary<String, AnyObject>
                    let open = timeframesgroup["open"]! as! NSArray
                    let renderedTime = open[0] as! Dictionary<String, AnyObject>
                    self.restaurant.heures = renderedTime["renderedTime"]! as? String
                    
                    
                }
                // address + lat + lng
                if venue["location"] != nil
                {
                    let location = venue["location"]! as! Dictionary<String, AnyObject>
                    self.restaurant.lat = location["lat"]! as? Float
                    self.restaurant.lng = location["lng"]! as? Float
                    let formattedAddress = location["formattedAddress"]! as! NSArray
                    self.restaurant.adresse = formattedAddress[0] as? String
                }
                
                //telephone
                if venue["contact"] != nil
                {
                    //                    if let contact : Dictionary<String, AnyObject> = venue["contact"]! as? Dictionary<String, AnyObject>{
                    //
                    //
                    //
                    //                        if let fbkPhone : String = contact["formattedPhone"]! as? String{
                    //                            self.restaurant.phoneNumber = fbkPhone
                    //                        }
                    //                    }
                    
                }
                
                //price
                if venue["price"] != nil
                {
                    let contact = venue["price"]! as! Dictionary<String, AnyObject>
                    self.restaurant.price = contact["currency"]! as? String
                    
                }
                
                
                
                
                
                // wifi
                if venue["attributes"] != nil
                {
                    let attributes = venue["attributes"]! as! Dictionary<String, AnyObject>
                    let groupAttributes = attributes["groups"]! as! NSArray
                    for p in(groupAttributes as NSArray){
                        if p != nil
                        {
                            let p2 = p as! Dictionary<String, AnyObject>
                            if p2["type"] as! String == "wifi"
                            {
                                let wifiItems = p2["items"] as! NSArray
                                let displayValue = wifiItems[0] as! Dictionary<String, AnyObject>
                                let valueWifi = displayValue["displayValue"] as! String
                                if valueWifi == "Yes"
                                {
                                    //self.ouiOuNonWifiImage.image = UIImage(named: "check24.png")
                                    self.restaurant.wifi = true
                                }
                                
                                
                            }
                            // reservation
                            if p2["type"] as! String == "reservations"
                            {
                                let reservationItems = p2["items"] as! NSArray
                                let displayValue = reservationItems[0] as! Dictionary<String, AnyObject>
                                let valueReservation = displayValue["displayValue"] as! String
                                if valueReservation == "Yes"
                                {
                                    self.restaurant.reservation = true
                                }
                                if valueReservation == "Groups Only"
                                {
                                    self.restaurant.reservation = true
                                }
                                
                                
                                
                            }
                            // terrasse
                            if p2["type"] as! String == "outdoorSeating"
                            {
                                let terrasseItems = p2["items"] as! NSArray
                                let displayValue = terrasseItems[0] as! Dictionary<String, AnyObject>
                                let valueterrasse = displayValue["displayValue"] as! String
                                if valueterrasse == "Yes"
                                {
                                    self.restaurant.terrasse = true
                                }
                                
                                
                            }
                            // livraison
                            if p2["summary"] as! String == "Delivery"{
                                let livraisonItems = p2["items"] as! NSArray
                                let displayValue = livraisonItems[0] as! Dictionary<String, AnyObject>
                                let valueLivraison = displayValue["displayValue"] as! String
                                if ((valueLivraison == "Delivery") || (valueLivraison == "Service de livraison"))
                                {
                                    self.restaurant.livraison = true
                                }
                            }
                            // payement
                            if p2["type"] as! String == "payments"
                            {
                                let payementItems = p2["items"] as! NSArray
                                let displayValue = payementItems[0] as! Dictionary<String, AnyObject>
                                let valuepayement = displayValue["displayValue"] as! String
                                if valuepayement == "Yes"
                                {
                                    self.restaurant.carteCredit = true
                                }
                                
                                
                            }
                            
                        }
                        
                    }
                    
                    
                }
            }
            
            //            self.addRestaurant()
            //            print("/**************/")
            
        }}
    
    
    func addRestaurant() -> Void{
        
        let urlAjoutResto = "http://192.168.1.2/restoeval/ajoutResto.php"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let param = [
            "nomResto": self.restaurant.username,
            "idRestoFoursquare": self.restaurant.idResto,
            "phoneResto": self.restaurant.phoneNumber,
            "lat": self.restaurant.lat,
            "lng": self.restaurant.lng,
            "adresse": self.restaurant.adresse,
            "price": self.restaurant.price,
            "likes": self.restaurant.likes,
            "rating": self.restaurant.rate,
            "heures": self.restaurant.heures,
            "reservation": self.restaurant.reservation,
            "wifi": self.restaurant.wifi,
            "terrasse": self.restaurant.terrasse,
            "livraison": self.restaurant.livraison,
            "toilette": self.restaurant.carteCredit,
            "codeFacebook": self.restaurant.codeFacebook,
            "nomFacebook": self.restaurant.nameFacebook,
            "imageResto": self.restaurant.imageResto
            ] as [String : Any]
        Alamofire.request(urlAjoutResto, method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                print(response.request as Any)  // original URL request
                print(response.response as Any) // URL response
                print(response.result.value as Any)   // result of response serialization
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : DetailSearch2TableViewCell = tableView.dequeueReusableCell(withIdentifier: "detCellView")! as! DetailSearch2TableViewCell
        cell.nomDetailCell.text = restaurants[indexPath.row].username
        cell.addresseDetailCell.text = restaurants[indexPath.row].adresse
        if let imgurl : String = restaurants[indexPath.row].imageResto{
            cell.imageUrl = imgurl
        }
        else{
            cell.imageViewDetailCell.image = #imageLiteral(resourceName: "lunch")
        }
        
        
        
        
        
        //        let restaurant: Restaurant!
        //        restaurant = restaurants[indexPath.row]
        //        if (restaurant.rate! < Float(2.0)){
        //            cell.star1.image = UIImage(named: "staryes.png")
        //            cell.star2.image = UIImage(named: "starno.png")
        //            cell.star3.image = UIImage(named: "starno.png")
        //            cell.star4.image = UIImage(named: "starno.png")
        //            cell.star5.image = UIImage(named: "starno.png")
        //
        //
        //        }
        //        else{
        //            if (restaurants[indexPath.row].rate! < Float(3.0)){
        //                cell.star1.image = UIImage(named: "staryes.png")
        //                cell.star2.image = UIImage(named: "staryes.png")
        //                cell.star3.image = UIImage(named: "starno.png")
        //                cell.star4.image = UIImage(named: "starno.png")
        //                cell.star5.image = UIImage(named: "starno.png")
        //
        //
        //            }else{
        //                if (restaurants[indexPath.row].rate! < Float(4.0)){
        //                    cell.star1.image = UIImage(named: "staryes.png")
        //                    cell.star2.image = UIImage(named: "staryes.png")
        //                    cell.star3.image = UIImage(named: "staryes.png")
        //                    cell.star4.image = UIImage(named: "starno.png")
        //                    cell.star5.image = UIImage(named: "starno.png")
        //
        //
        //                }
        //                else{
        //                    if (restaurants[indexPath.row].rate! < Float(5.0)){
        //                        cell.star1.image = UIImage(named: "staryes.png")
        //                        cell.star2.image = UIImage(named: "staryes.png")
        //                        cell.star3.image = UIImage(named: "staryes.png")
        //                        cell.star4.image = UIImage(named: "staryes.png")
        //                        cell.star5.image = UIImage(named: "starno.png")
        //
        //                    }
        //                    else
        //                    {
        //                        if (restaurants[indexPath.row].rate! < Float(6.0)){
        //                            cell.star1.image = UIImage(named: "staryes.png")
        //                            cell.star2.image = UIImage(named: "staryes.png")
        //                            cell.star3.image = UIImage(named: "staryes.png")
        //                            cell.star4.image = UIImage(named: "staryes.png")
        //                            cell.star5.image = UIImage(named: "staryes.png")
        //                        }
        //                    }
        //
        //                }
        //            }
        //        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

