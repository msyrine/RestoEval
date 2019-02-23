//
//  PhotosRestoViewController.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/14/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit
import MobileCoreServices
import Alamofire

class PhotosRestoViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var imgAddImage: UIButton!
    var imgConbine: String = ""
    
    let url = "https://api.foursquare.com/v2/venues/56f96691498e9737c40c72f4?client_id=USQH4QWAWU11IETPL5K1W1YE4KLL54XLUTBI5O3H5GB4ZWHV&client_secret=S3CRJYTITM3DCLHPDO5FNXPQ3QVLUNLHMNSGQJUUOM3RJD2B&v=20141215"
    
    static let leftAndRightPaddings: CGFloat = 2.0
    static let numberOfItemsPerRow: CGFloat = 4.0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
     private var imagePicker: UIImagePickerController!
    
    
    var ImagePhotoResto = [String]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        Alamofire.request(url).responseJSON { responsep in
            if(responsep.result.isSuccess){
                let dictp = responsep.result.value! as? Dictionary<String, AnyObject>
                let responseJson = dictp?["response"]! as? Dictionary<String, AnyObject>
                let venue = responseJson?["venue"]! as? Dictionary<String, AnyObject>
                
                // photo
                let photo = venue?["photos"]! as! Dictionary<String, AnyObject>
                let groups = photo["groups"]! as! NSArray
                let group = groups[0] as! Dictionary<String, AnyObject>
                    if group["count"]! as! Int != 0
                    {
                        let items = group["items"]! as! NSArray
                        for p in (items as NSArray)
                        {
                            let item = p as! Dictionary<String, AnyObject>
                            let prefix = item["prefix"]! as! String
                            let suffix = item["suffix"]! as! String
                            self.imgConbine = prefix + "50x50" + suffix
                            self.ImagePhotoResto.append(self.imgConbine)
                           // print(self.ImagePhotoResto)
                            
                            self.collectionView.reloadData()
                            
                        }
                    }
            }else{
                
            }
        }
        
                
                

        //self.ImagePhotoResto = ["1.png","2.png","x1.png","x2.png","x3.png","x4.png"]
        
        
        // rendre bouton circulaire
        
        self.imgAddImage.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        self.imgAddImage.layer.cornerRadius = 0.5 * self.imgAddImage.bounds.size.width
        self.imgAddImage.clipsToBounds = true
        
        // Do any additional setup after loading the view.
        
        let collectionViewWidth = self.collectionView?.frame.width
        let itemWidth = (collectionViewWidth! + PhotosRestoViewController.leftAndRightPaddings) / PhotosRestoViewController.numberOfItemsPerRow
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth , height: itemWidth)

        
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


    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.ImagePhotoResto.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoRestoCell", for: indexPath) as! PhotosRestoCollectionViewCell
         self.load_image(image_url_string: ImagePhotoResto[indexPath.row], view: myCell.ImgViewPhotoRestoCell)
        
        return myCell
    }

    
    func AjouterPhotoPhotoRestoButton(_ sender: Any)
    {
     
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            imagePicker.sourceType = .camera
        }
        else{
            imagePicker.sourceType = .photoLibrary
        }
        
        imagePicker.allowsEditing = true
        
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: imagePicker.sourceType)!
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }

}

extension PhotosRestoViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        self.dismiss(animated: true, completion: nil)
        print("user canceled the camera / photo library")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        if mediaType == (kUTTypeImage as String)
        {
            // a photo was taken
           // self.ImagePhotoResto.append( )
            
           // info[UIImagePickerControllerOriginalImage] as? UIImage
//            let nmImg : String = Date().toMillis().description
//            let image = UIImage.init(named: nmImg)
//            let imgData = UIImageJPEGRepresentation(image!, 0.2)!
//            
//            let parameters = ["name": image] //Optional for extra parameter
//            
//            Alamofire.upload(multipartFormData: { multipartFormData in
//                multipartFormData.append(imgData, withName: "fileset",fileName: "file.jpg", mimeType: "image/jpg")
//                for (key, value) in parameters {
//                    multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
//                } //Optional for extra parameters
//            },
//                             to:"mysite/upload.php")
//            { (result) in
//                switch result {
//                case .success(let upload, _, _):
//                    
//                    upload.uploadProgress(closure: { (progress) in
//                        print("Upload Progress: \(progress.fractionCompleted)")
//                    })
//                    
//                    upload.responseJSON { response in
//                        print(response.result.value)
//                    }
//                    
//                case .failure(let encodingError):
//                    print(encodingError)
//                }
//            }
        }
        else
        {
            // a video was shot
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}



extension Date {
    func toMillis() -> Int64! {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
