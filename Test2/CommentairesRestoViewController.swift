//
//  CommentairesRestoViewController.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/19/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit
import Alamofire

class CommentairesRestoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var commentaireArray = [String]()
    var NameUserArray = [String]()
    var imageUserArray = [String]()
    
    var img: String!
    var nameuser: String!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var labelCommentaireFixDesign: UILabel!
    @IBOutlet weak var buttonAjouterCommentaire: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let url = "https://api.foursquare.com/v2/venues/56f96691498e9737c40c72f4?client_id=USQH4QWAWU11IETPL5K1W1YE4KLL54XLUTBI5O3H5GB4ZWHV&client_secret=S3CRJYTITM3DCLHPDO5FNXPQ3QVLUNLHMNSGQJUUOM3RJD2B&v=20141215"
        self.img = ""
        self.nameuser = ""
        
        Alamofire.request(url).responseJSON { responsep in
            if(responsep.result.isSuccess){
                let dictp = responsep.result.value! as? Dictionary<String, AnyObject>
                let responseJson = dictp?["response"]! as? Dictionary<String, AnyObject>
                let venue = responseJson?["venue"]! as? Dictionary<String, AnyObject>
                
                
                
                // commentaire
                if venue?["tips"] != nil
                {
                    let tips = venue?["tips"]! as! Dictionary<String, AnyObject>
                    let groups = tips["groups"]! as! NSArray
                    let group = groups[0] as! Dictionary<String, AnyObject>
                    if group["count"]! as! Int != 0
                    {
                        let items = group["items"]! as! NSArray
                        for c in (items as NSArray )
                        {
                            // commentaire
                            let item = c as! Dictionary<String, AnyObject>
                            
                            
                            let text = item["text"]! as! String
                            self.commentaireArray.append(text)
                            
                            // user name
                            let user = item["user"]! as! Dictionary<String, AnyObject>
                          //  print(user)
                            let firstName = user["firstName"]! as! String
                            //print(firstName)
                          //  let lastNameuser = user["lastName"]! as! String
                          //  self.nameuser = lastNameuser + " " + firstName
                            self.nameuser = firstName
                            self.NameUserArray.append(firstName)
                        
                            
                            // user photo
                            let photo = user["photo"]! as! Dictionary<String, AnyObject>
                            let prefix = photo["prefix"]! as! String
                            let suffix = photo["suffix"]! as! String
                            self.img = prefix + "39x39" + suffix
                            self.imageUserArray.append(self.img)
                            
                            self.tableView.reloadData()
                        }
                        
                        
                        
                        
                    }
                    
                    
                }
             //   print(self.commentaireArray)
               // print(self.NameUserArray)
               // print(self.imageUserArray)
                
                
                
            }else { 
            }
        }
        

        
        //rendre le bouton circulaire
        
        buttonAjouterCommentaire.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        buttonAjouterCommentaire.layer.cornerRadius = 0.5 * buttonAjouterCommentaire.bounds.size.width
        buttonAjouterCommentaire.clipsToBounds = true
        
        // design du label commentaire juste au top
        
        labelCommentaireFixDesign.layer.borderWidth = 0.25
        labelCommentaireFixDesign.layer.borderColor = UIColor.gray.cgColor
        
        print(commentaireArray)
        

        // Do any additional setup after loading the view.
    }

   
    
    @IBAction func addCommentAction(_ sender: Any) {
        /***
                let alert = UIAlertController(title: "ajouter un commentaire", message: "", preferredStyle: .alert)
        
        // Submit button
            let submitAction = UIAlertAction(title: "Submit", style: .default, handler: { (action) -> Void in
                // Get 1st TextField's text
                let textField = alert.textFields![0]
                print(textField.text!)
            })
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })

        // Add 1 textField and customize it
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = "Votre commentaire"
            textField.clearButtonMode = .whileEditing
        }
        
        // Add action buttons and present the Alert
        alert.addAction(submitAction)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
        ***/
             //   alert.addAction(UIAlertAction(title: "confirm", style: .default, handler: nil))
              //  self.present(alert, animated: true, completion: nil)

        
    }
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentaireArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentaireRestoTableCell", for: indexPath)
        let imgView: UIImageView = cell.viewWithTag(100) as! UIImageView
        self.load_image(image_url_string: imageUserArray[indexPath.row], view: imgView)
        let labelNameUser: UILabel = cell.viewWithTag(101) as! UILabel
        labelNameUser.text = NameUserArray[indexPath.row]
        let labelCommentaire: UILabel = cell.viewWithTag(102) as! UILabel
        labelCommentaire.text = commentaireArray[indexPath.row]
        
        return cell
    }

}
