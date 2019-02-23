//
//  SearchResultsController.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/26/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit
import SwiftyJSON



protocol LocateOnTheMap
{
    func locateWithLongitude(lon:Double, andLatitude lat:Double, andTitle title: String)
}

class SearchResultsController: UITableViewController {
    
    var searchResults: [String]!
    var delegate: LocateOnTheMap!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.searchResults = Array()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.searchResults.count
    }
    
    
    
    
  


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
     
     
     
     cell.textLabel?.text = self.searchResults[indexPath.row]
     return cell    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    func tableView(tableView: UITableView,
                   didSelectRowAtIndexPath indexPath: NSIndexPath)
        
    {
        // 1
        
        
        self.dismiss(animated: true, completion: nil)
        // 2
        
        let correctedAddress:String! = self.searchResults[indexPath.row].addingPercentEncoding(withAllowedCharacters: NSCharacterSet.symbols)
        
        //let correctedAddress:String! = self.searchResults[indexPath.row].stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.symbolCharacterSet())
        
        let url = URL(string: "https://maps.googleapis.com/maps/api/geocode/json?address=\(correctedAddress)&sensor=false")!
        
        typealias JSONDictionary = [String:Any]
        
        //  let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) -> Void in
            do {
                if data != nil{
                    if  let dic = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as? JSONDictionary
                        
                    {
                        if let results = dic["results"] as? JSONDictionary,
                            let geometry = results["geometry"] as? JSONDictionary,
                            let location = geometry["location"] as? JSONDictionary,
                            let latitudes = location["lat"] as? [Double], !latitudes.isEmpty,
                            let longitudes = location["lng"] as? [Double], !longitudes.isEmpty {
                            let lat = latitudes[0]
                            let lng = longitudes[0]
                            
                            self.delegate.locateWithLongitude(lon: lng, andLatitude: lat, andTitle: self.searchResults[indexPath.row] )
                        }
                    }
                    
                    
                    
                }
            }catch {
                print("Error")
            }
        })
        
        task.resume()
    }
    
    
}
