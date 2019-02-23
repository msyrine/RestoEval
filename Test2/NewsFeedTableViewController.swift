//
//  NewsFeedTableViewController.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/22/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit

class NewsFeedTableViewController: UITableViewController {
    
    
    var posts: [Offre]?
    
    struct StoryBoard {
        static let postCell = "PostCell"
        static let postHeaderCell = "PostHeaderCell"
        static let postHearderHeight: CGFloat = 57.0
        static let postCellDefaultHeight: CGFloat = 560.0
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.fetchPosts()
        
        
        tableView.estimatedRowHeight = StoryBoard.postCellDefaultHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorColor = UIColor.clear
    
    }

   
    func fetchPosts()
    {
        self.posts = Offre.fetchOffres()
        self.tableView.reloadData()
    }
    
    
    
    
}
extension NewsFeedTableViewController
{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let posts = posts {
            return posts.count
        }
        else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _ = posts
        {
            return 1
        }
        else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryBoard.postCell, for: indexPath) as! PostCell
        cell.post = self.posts?[indexPath.section]
        cell.selectionStyle = .none
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryBoard.postHeaderCell) as! PostHeaderCell
        
        cell.post = self.posts?[section]
        cell.backgroundColor = UIColor.white
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return StoryBoard.postHearderHeight
    }
    
    
}
