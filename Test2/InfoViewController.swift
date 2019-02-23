//
//  InfoViewController.swift
//  Test2
//
//  Created by Kapitaliste Jonathan on 2017-12-19.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit
import Alamofire

class InfoViewController: UIViewController {
    

    @IBOutlet weak var ratingNameLabel: UILabel!
    
    @IBOutlet weak var HeuresNameLabel: UILabel!
   
    @IBOutlet weak var View1Rating: UIView!
    
     @IBOutlet weak var ViewTelephone: UIView!

     @IBOutlet weak var ViewAdresse: UIView!
    
    @IBOutlet weak var View2Heures: UIView!
    
     @IBOutlet weak var ViewFavoris: UIView!
    
     @IBOutlet weak var ViewEvaluer: UIView!
    
     @IBOutlet weak var ViewPartager: UIView!
    
    @IBOutlet weak var AdresseNameLabel: UILabel!
     
    @IBOutlet weak var TelephoneNameLabel: UILabel!
    
    @IBOutlet weak var CaracteristiquesNameLabel: UILabel!
    
    @IBOutlet weak var ouiOuNonWifiImage: UIImageView!
    
    @IBOutlet weak var heureLabelModif: UILabel!
    
    @IBOutlet weak var adressLabelModif: UILabel!
    
    @IBOutlet weak var telephoneLabelModif: UILabel!
    
    @IBOutlet weak var ouiOuNonTerrasseImg: UIImageView!
    
    @IBOutlet weak var ouiOuNonLivraisonImg: UIImageView!
    
    @IBOutlet weak var ouiOuNonReservationImg: UIImageView!
    
    @IBOutlet weak var ouiOuNonCreditImg: UIImageView!
    
    @IBOutlet weak var categoryLabelChange: UILabel!
    
    @IBOutlet weak var numberRatingLabel: UILabel!
    
    
    @IBOutlet weak var starOne: UIButton!
    
    @IBOutlet weak var starTwo: UIButton!
    
    @IBOutlet weak var starThree: UIButton!
    
    
    @IBOutlet weak var starFour: UIButton!
    
    
    @IBOutlet weak var starFive: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let url = "https://api.foursquare.com/v2/venues/56f96691498e9737c40c72f4?client_id=USQH4QWAWU11IETPL5K1W1YE4KLL54XLUTBI5O3H5GB4ZWHV&client_secret=S3CRJYTITM3DCLHPDO5FNXPQ3QVLUNLHMNSGQJUUOM3RJD2B&v=20141215"
        
        
        Alamofire.request(url).responseJSON { responsep in
            if(responsep.result.isSuccess){
                let dictp = responsep.result.value! as? Dictionary<String, AnyObject>
                print(dictp)
                let responseJson = dictp?["response"]! as? Dictionary<String, AnyObject>
                let venue = responseJson?["venue"]! as? Dictionary<String, AnyObject>
                
                
                if venue?["rating"] != nil
                {
                    let rating = venue?["rating"]! as! Double
                    let rate = rating / 2
                    self.numberRatingLabel.text = String(rate)
                    
                    if rate < 1.0
                    {
                        self.starOne.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
                        
                        self.starTwo.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
                        self.starThree.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
                        self.starFour.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
                        self.starFive.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
                    }
                    else
                    {
                        if rate < 2.0
                        {
                            self.starTwo.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
                            self.starOne.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
                            
                            self.starThree.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
                            self.starFour.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
                            self.starFive.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
                        }
                        else{
                            if rate < 3.0
                            {
                                
                                self.starTwo.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
                                self.starOne.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
                                
                                self.starThree.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
                                self.starFour.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
                                self.starFive.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
                            }
                            else{
                                if rate < 4.0
                                {
                                    self.starThree.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
                                    self.starTwo.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
                                    self.starOne.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
                                    
                                    self.starFour.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
                                    self.starFive.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
                                }
                                else{
                                    if rate < 5.0
                                    {
                                        self.starFour.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
                                        self.starThree.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
                                        self.starTwo.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
                                        self.starOne.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
                                        
                                        self.starFive.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
                                        
                                    }
                                   else
                                    {
                                        if rate < 6.0
                                        {
                                            self.starFive.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
                                            self.starFour.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
                                            self.starThree.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
                                            self.starTwo.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
                                            self.starOne.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
                                        }
                                    }
                                
                                }

                            }
                        }
                        
                    }
            
                    
                }
                
                
                // Heures
                if venue?["hours"] != nil
                {
                    let hours = venue?["hours"]! as! Dictionary<String, AnyObject>
                    let timeFrames = hours["timeframes"]! as! NSArray
                    let timeframesgroup = timeFrames[0] as! Dictionary<String, AnyObject>
                    let open = timeframesgroup["open"]! as! NSArray
                    let renderedTime = open[0] as! Dictionary<String, AnyObject>
                    self.heureLabelModif.text = renderedTime["renderedTime"]! as? String
                    
                    
                }
                // address
                if venue?["location"] != nil
                {
                    let location = venue?["location"]! as! Dictionary<String, AnyObject>
                    let formattedAddress = location["formattedAddress"]! as! NSArray
                    self.adressLabelModif.text = formattedAddress[0] as? String
                }
                
                //telephone
                if venue?["contact"] != nil
                {
                    let contact = venue?["contact"]! as! Dictionary<String, AnyObject>
                    self.telephoneLabelModif.text = contact["formattedPhone"]! as? String
                }
                // wifi
                if venue?["attributes"] != nil
                {
                    let attributes = venue?["attributes"]! as! Dictionary<String, AnyObject>
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
                                    self.ouiOuNonWifiImage.image = UIImage(named: "check24.png")
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
                                    self.ouiOuNonReservationImg.image = UIImage(named: "check24.png")
                                }
                                if valueReservation == "Groups Only"
                                {
                                    self.ouiOuNonReservationImg.image = UIImage(named: "check24.png")
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
                                    self.ouiOuNonTerrasseImg.image = UIImage(named: "check24.png")
                                }
                                
                                
                            }
                            // livraison
                            
                            if p2["summary"] as! String == "Delivery"
                            {
                                let livraisonItems = p2["items"] as! NSArray
                                let displayValue = livraisonItems[0] as! Dictionary<String, AnyObject>
                                let valueLivraison = displayValue["displayValue"] as! String
                                if ((valueLivraison == "Delivery") || (valueLivraison == "Service de livraison"))
                                {
                                    self.ouiOuNonLivraisonImg.image = UIImage(named: "check24.png")
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
                                    self.ouiOuNonCreditImg.image = UIImage(named: "check24.png")
                                }
                                
                                
                            }
                            
                        }
                        
                    }
                    
                    var categoriesName: String!
                    categoriesName = ""
                    // categories
                    if venue?["categories"] != nil
                    {
                        let categories = venue?["categories"]! as! NSArray
                        for l in(categories as NSArray)
                        {
                            
                            let l2 = l as! Dictionary<String, AnyObject>
                            
                            let shortName = l2["shortName"]! as! String
                            categoriesName = categoriesName + shortName + ", "
                            print(shortName)
                            
                            
                        }
                        
                        self.categoryLabelChange.text = categoriesName
                        // let categori = categories[0] as? Dictionary<String, AnyObject>
                        
                        //  self.categorieResto.text = categori?["name"]! as? String
                        //  }else{
                        //      self.categorieResto.text = "Aucune catégorie n'est répertoriée"
                        // }
                        
                        
                    }
                    
                    
                    
                }
                
                
                
                
            }else{
                
            }
        }
        
       // self.view.backgroundColor = UIColor.darkGray

        self.View1Rating.layer.borderWidth = 0.25
        self.View1Rating.layer.borderColor = UIColor.gray.cgColor
        
        self.View2Heures.layer.borderWidth = 0.25
        self.View2Heures.layer.borderColor = UIColor.gray.cgColor
        
        self.ViewAdresse.layer.borderWidth = 0.25
        self.ViewAdresse.layer.borderColor = UIColor.gray.cgColor
        
        self.ViewTelephone.layer.borderWidth = 0.25
        self.ViewTelephone.layer.borderColor = UIColor.gray.cgColor
        
        self.ViewFavoris.layer.borderWidth = 0.25
        self.ViewFavoris.layer.borderColor = UIColor.gray.cgColor
        
        self.ViewEvaluer.layer.borderWidth = 0.25
        self.ViewEvaluer.layer.borderColor = UIColor.gray.cgColor
        
        self.ViewPartager.layer.borderWidth = 0.25
        self.ViewPartager.layer.borderColor = UIColor.gray.cgColor
        
        self.HeuresNameLabel.layer.borderWidth = 0.25
        self.HeuresNameLabel.layer.borderColor = UIColor.gray.cgColor
        
        self.AdresseNameLabel.layer.borderWidth = 0.25
        self.AdresseNameLabel.layer.borderColor = UIColor.gray.cgColor
        
        self.CaracteristiquesNameLabel.layer.borderWidth = 0.25
        self.CaracteristiquesNameLabel.layer.borderColor = UIColor.gray.cgColor
        
        self.TelephoneNameLabel.layer.borderWidth = 0.25
        self.TelephoneNameLabel.layer.borderColor = UIColor.gray.cgColor
        
        self.ratingNameLabel.layer.borderWidth = 0.25
        self.ratingNameLabel.layer.borderColor = UIColor.gray.cgColor
        
        
        // Do any additional setup after loading the view.
    }
 

}
