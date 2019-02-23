//
//  RestoCaracteristiquesViewController.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/13/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit
import Alamofire

class RestoCaracteristiquesViewController: UIViewController{

    
 

    @IBOutlet weak var view1: UIView!
    
    
    @IBOutlet weak var adresseResto: UILabel!
   
    @IBOutlet weak var HeuresResto: UILabel!
    
    @IBOutlet weak var categorieResto: UILabel!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = "https://api.foursquare.com/v2/venues/56f96691498e9737c40c72f4?client_id=USQH4QWAWU11IETPL5K1W1YE4KLL54XLUTBI5O3H5GB4ZWHV&client_secret=S3CRJYTITM3DCLHPDO5FNXPQ3QVLUNLHMNSGQJUUOM3RJD2B&v=20141215"
        
       
      //  print(url)
        
        Alamofire.request(url).responseJSON { responsep in
            if(responsep.result.isSuccess){
                let dictp = responsep.result.value! as? Dictionary<String, AnyObject>
                let responseJson = dictp?["response"]! as? Dictionary<String, AnyObject>
                let venue = responseJson?["venue"]! as? Dictionary<String, AnyObject>
                
                
            // adresse
                if venue?["location"] != nil
                {
                let location = venue?["location"]! as! Dictionary<String, AnyObject>
                 let formattedAddress = location["formattedAddress"]! as! NSArray
                 self.adresseResto.text = formattedAddress[0] as? String
                }else{
                    self.adresseResto.text = "Aucune adresse n'est répertoriée"
                }
                
                // categories
                if venue?["categories"] != nil
                {
                let categories = venue?["categories"]! as! NSArray
                let categori = categories[0] as? Dictionary<String, AnyObject>
                self.categorieResto.text = categori?["name"]! as? String
                }else{
                     self.categorieResto.text = "Aucune catégorie n'est répertoriée"
                }
                
                // hours
                if venue?["hours"] != nil
                {
               let hours = venue?["hours"]! as! Dictionary<String, AnyObject>
                 self.HeuresResto.text = hours["status"]! as? String
                }
                else{
                    self.HeuresResto.text = "Aucune heures n'est répertoriées"
                }
                
                
                // commentaires
//                if venue?["tips"] != nil
//                {
//                    let tips = venue?["tips"]! as? Dictionary<String, AnyObject>
//                    if  tips?["groups"] != nil
//                    {
//                        let groups = tips?["groups"]! as? NSArray
//                            if groups?[0] != nil
//                            {
//                                let items = groups?[0] as? NSArray
//                                if items?[0] != nil
//                                    {
//                                        let item = items?[0] as? Dictionary<String, AnyObject>
//                                        self.commentaireText.text = item?["text"]! as? String
//
//                                    }
//                                
//                            }
//                       
//                    }
//                }
                
                
                
            }else{
                
            }
            
            
            
        }
        
        
//        Alamofire.request(urlPath!,method:.post).responseJSON { responsep in
//            if(responsep.result.isSuccess){
//                let dictp = responsep.result.value! as? Dictionary<String, AnyObject>
//                
//                
//                let success = dictp?["success"]! as? Int
//                if(success?.hashValue==1){
//                    let user = dictp?["user"]! as? Dictionary<String, AnyObject>
//                    let data = dictp?["data"]! as? Dictionary<String, AnyObject>
//                    let image = user?["image"] as? String
//                    let nom = user?["nom"] as? String
//                    let prenom = user?["prenom"] as? String
//                    let username = user?["username"] as? String
//                    let role = user?["role"] as? String
//                    let numtel = user?["numtel"] as? String
//                    let email = user?["email"] as? String
//                    let token = data?["id"] as? Int
//                    
//                    SignUpViewController.tokensec = data?["token"] as! String
//                    print(SignUpViewController.tokensec)
//                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "Accueil") as! UINavigationController
//                    self.present(newViewController, animated: true, completion: nil)
//                }else{
//                    
//                }
//                
//                
//                
//                
//                
//            }else if(responsep.result.isFailure){
//                print("le le")
//            }
        
        
        
        
        
        
        
        
        
        

//        view1.layer.borderWidth = 0.25
//        view1.layer.borderColor = UIColor.gray.cgColor
        
       
        
//     labelPhotosDuRestaurant.layer.borderWidth = 0.25
//        labelPhotosDuRestaurant.layer.borderColor = UIColor.gray.cgColor
        
        
      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    

    
    

}
