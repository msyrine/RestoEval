//
//  AjouterRestoViewController.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/27/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit

class AjouterRestoViewController: UIViewController {

    @IBOutlet weak var plusDeCaracteristiquesView: UIView!
    
    @IBOutlet weak var AjoutPlusDeCaracteristiqueButtonOutlet: UIButton!
    
    @IBOutlet weak var AjouterRestoLfou9Outlet: UIButton!
    
    @IBOutlet weak var AnnulerAjoutRestoLfou9Outlet: UIButton!
    
    @IBOutlet weak var AjouterRestoLoutaOutlet: UIButton!
    
    @IBOutlet weak var AnnulerAjoutRestoLoutaOutlet: UIButton!
    
    
    var hidView = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plusDeCaracteristiquesView.isHidden = true
        AjouterRestoLoutaOutlet.isHidden = true
        AnnulerAjoutRestoLoutaOutlet.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func AjoutPlusDeCaracteristiqueButton(_ sender: Any) {
        if hidView == 0
        {
            plusDeCaracteristiquesView.isHidden = false
            hidView = 1
            AjoutPlusDeCaracteristiqueButtonOutlet.setTitle("Moins de caractéristiques", for: UIControlState.normal)
           
            AjouterRestoLoutaOutlet.isHidden = false
            AnnulerAjoutRestoLoutaOutlet.isHidden = false
            
            AjouterRestoLfou9Outlet.isHidden = true
            AnnulerAjoutRestoLfou9Outlet.isHidden = true
            
        }
        else{
            plusDeCaracteristiquesView.isHidden = true
            hidView = 0
            AjoutPlusDeCaracteristiqueButtonOutlet.setTitle("Ajouter plus de caractéristiques", for: UIControlState.normal)
            
            
            AjouterRestoLoutaOutlet.isHidden = true
            AnnulerAjoutRestoLoutaOutlet.isHidden = true
            
            AjouterRestoLfou9Outlet.isHidden = false
            AnnulerAjoutRestoLfou9Outlet.isHidden = false
        }
    }
}
