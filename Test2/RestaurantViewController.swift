//
//  RestaurantViewController.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/13/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit
import Alamofire

class RestaurantViewController: UIViewController, UICollectionViewDataSource , UICollectionViewDelegate{
    @IBOutlet weak var CaracteristicView: UIView!
    @IBOutlet weak var InfoView: UIView!
    @IBOutlet weak var PhotoView: UIView!
    @IBOutlet weak var CommentaireView: UIView!
    
    
    @IBOutlet weak var starOne: UIButton!
    @IBOutlet weak var starTwo: UIButton!
    @IBOutlet weak var starThree: UIButton!
    @IBOutlet weak var starFour: UIButton!
    @IBOutlet weak var starFive: UIButton!
    
    
    var testStarOne : Bool = false
    var testStarTwo : Bool = false
    var testStarThree : Bool = false
    var testStarFour : Bool = false
    var testStarFive : Bool = false

    @IBOutlet weak var imageViewResto: UIImageView!
    @IBOutlet weak var NameRestaurant: UILabel!
   
    var labelNames = [String]()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://api.foursquare.com/v2/venues/56f96691498e9737c40c72f4?client_id=USQH4QWAWU11IETPL5K1W1YE4KLL54XLUTBI5O3H5GB4ZWHV&client_secret=S3CRJYTITM3DCLHPDO5FNXPQ3QVLUNLHMNSGQJUUOM3RJD2B&v=20141215"
        
        
        //  print(url)
        
        Alamofire.request(url).responseJSON { responsep in
            if(responsep.result.isSuccess){
                let dictp = responsep.result.value! as? Dictionary<String, AnyObject>
                let responseJson = dictp?["response"]! as? Dictionary<String, AnyObject>
                let venue = responseJson?["venue"]! as? Dictionary<String, AnyObject>
                self.NameRestaurant.text = venue?["name"]! as? String
                let bestPhoto = venue?["bestPhoto"]! as? Dictionary<String, AnyObject>
                let prefix = bestPhoto?["prefix"]! as? String
                let suffix = bestPhoto?["suffix"]! as? String
                let imageUrlString = prefix! + "320x192" + suffix!
                
                self.load_image(image_url_string: imageUrlString, view:self.imageViewResto) 
                
               
                
                if venue?["rating"] != nil
                {
                    let rating = venue?["rating"]! as! Double
                    let rate = rating / 2
                   
                    
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

                
            }else{
                
            }
            
            
            
        }
        
        labelNames.insert("Caractéristiques", at: 0)
        labelNames.insert("Infos", at: 1)
        labelNames.insert("Commentaires", at: 2)
        labelNames.insert("Photos", at: 3)

        // Do any additional setup after loading the view.
    }

    //fonction recuperation du photo principale
    
    func load_image(image_url_string:String, view:UIImageView)
    {
        
        let image_url: NSURL = NSURL(string: image_url_string)!
        let image_from_url_request: NSURLRequest = NSURLRequest(url: image_url as URL)
        
        NSURLConnection.sendAsynchronousRequest(
            image_from_url_request as URLRequest, queue: OperationQueue.main,
            completionHandler: {(response: URLResponse?,
                data: Data?,
                error: Error?) -> Void in
                
                if error == nil && data != nil {
                    view.image = UIImage(data: data!)
                }
                
        })
        
    }
    
    
//    @IBAction func starOneClick(_ sender: Any)
//    {
//        
//        starOne.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
//        
//        starTwo.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
//        starThree.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
//        starFour.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
//        starFive.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
//        testStarTwo = false
//        testStarThree = false
//        testStarFour = false
//        testStarFive = false
//        
//        
//        
//        testStarOne = true
//        
//        
//    }
//    
//    
//    @IBAction func starTwoClick(_ sender: Any)
//    {
//        
//        starTwo.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
//        starOne.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
//        
//        starThree.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
//        starFour.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
//        starFive.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
//        testStarThree = false
//        testStarFour = false
//        testStarFive = false
//        
//        testStarTwo = true
//        testStarOne = true
//        
//        
//    }
//    
//    
//    @IBAction func starThreeClick(_ sender: Any)
//    {
//        
//        starThree.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
//        starTwo.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
//        starOne.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
//        
//        starFour.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
//        starFive.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
//        testStarFour = false
//        testStarFive = false
//        
//        
//        testStarThree = true
//        testStarTwo = true
//        testStarOne = true
//        
//        
//        
//    }
//    
//    @IBAction func starFourClick(_ sender: Any)
//    {
//        starFour.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
//        starThree.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
//        starTwo.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
//        starOne.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
//        
//        starFive.setImage(UIImage(named: "starno.png")!, for: UIControlState.normal)
//        testStarFive = false
//        
//        testStarFour = true
//        testStarThree = true
//        testStarTwo = true
//        testStarOne = true
//        
////        let alert = UIAlertController(title: "rate", message: "vous avez raté 4 / 5...", preferredStyle: .alert)
////        alert.addAction(UIAlertAction(title: "confirm", style: .default, handler: nil))
////        self.present(alert, animated: true, completion: nil)
//        
//        
//    }
//    
//    
//    
//    @IBAction func starFiveClick(_ sender: Any)
//    {
//        
//        starFive.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
//        starFour.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
//        starThree.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
//        starTwo.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
//        starOne.setImage(UIImage(named: "staryes.png")!, for: UIControlState.normal)
//        testStarFive = true
//        testStarFour = true
//        testStarThree = true
//        testStarTwo = true
//        testStarOne = true
//        
//        
//        
//    }

    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labelNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellRestoBar", for: indexPath) as! RestaurantBarChoisesCollectionViewCell
        myCell.TitleBarChoises.text = labelNames[indexPath.row]
       myCell.delegate = self
        return myCell
    }
    
    

}


extension RestaurantViewController: selectionProtocol{
    func selected(choice : String){
        switch choice {
        case "Caractéristiques":
             self.CaracteristicView.isHidden = false
             InfoView.isHidden = true
             PhotoView.isHidden = true
             CommentaireView.isHidden = true
            break
        case "Infos":
            self.CaracteristicView.isHidden = true
            InfoView.isHidden = false
            PhotoView.isHidden = true
            CommentaireView.isHidden = true
            break
        case "Commentaires":
            self.CaracteristicView.isHidden = true
            InfoView.isHidden = true
            PhotoView.isHidden = true
            CommentaireView.isHidden = false
            break
        case "Photos":
            self.CaracteristicView.isHidden = true
            InfoView.isHidden = true
            PhotoView.isHidden = false
            CommentaireView.isHidden = true
            break
        default:
            print("")
        }
    }
}
