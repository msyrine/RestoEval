//
//  SearchResultsViewController.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/26/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit
import GoogleMaps



class SearchResultsViewController: UIViewController, LocateOnTheMap {

    
    var searchResultController:SearchResultsController!
    var resultsArray = [String]()
    var googleMapsView:GMSMapView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  self.googleMapsView =  GMSMapView(frame: self.mapViewContainer.frame)
    //    self.view.addSubview(self.googleMapsView)
        searchResultController = SearchResultsController()
        searchResultController.delegate = self

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

    
   
    func locateWithLongitude(lon: Double, andLatitude lat: Double, andTitle title: String) {
        
      //  dispatch_async(dispatch_get_main_queue()) { () -> Void in
      //      let position = CLLocationCoordinate2DMake(lat, lon)
       //     let marker = GMSMarker(position: position)
            
      //      let camera  = GMSCameraPosition.cameraWithLatitude(lat, longitude: lon, zoom: 10)
      //      self.googleMapsView.camera = camera
            
       //     marker.title = title
         //   marker.map = self.googleMapsView
        }
    }

    
    

