//
//  AjouterCommentaireViewController.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/25/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit
import MobileCoreServices

class AjouterCommentaireViewController: UIViewController {
    
    
    @IBOutlet weak var imageViewAjouterPhoto: UIImageView!
    
    @IBOutlet weak var textViewAjouterPhoto: UITextView!
    
     private var imagePicker: UIImagePickerController!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textViewAjouterPhoto.becomeFirstResponder()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        textViewAjouterPhoto.text = ""

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButton(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    

    
    @IBAction func AjouterPhotoButton(_ sender: UIButton)
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
    
    
    @IBAction func keyBoardOff(_ sender: Any)
    {
        textViewAjouterPhoto.resignFirstResponder()

    }

}
extension AjouterCommentaireViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate
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
            self.imageViewAjouterPhoto.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
        else
        {
            // a video was shot
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
















