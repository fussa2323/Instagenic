//
//  FeedListItemViewController.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 12/5/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit
import Alamofire
import FastImageCache
import SwiftyJSON

class FeedListItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    let accessToken = CurrentAccount.sharedController.account?.accessToken
    let username = CurrentAccount.sharedController.account?.userName
    var photos = [Photo]()
    let refreshControl = UIRefreshControl()
    var populatingPhotos = false
    var nextURLRequest: NSURLRequest?
    
    //--------------------
    // MARK: Life-cycle
    //--------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //----------------------------
    // MARK: UITableViewDelegate
    //----------------------------
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FeedListItemCell", forIndexPath: indexPath) as! FeedListItemTableViewCell
        
        
        return cell
    }
    
    //----------------------------
    // MARK: Request methods
    //----------------------------
    
    func loadFeedData() {
        if populatingPhotos {
            return
        }
        
        populatingPhotos = true
        
        Alamofire.request(Instagram.Router.GetUserFeed(self.username!, self.accessToken!, "", ""))
            .responseJSON { (request, response, result) -> Void in
                defer {
                    self.populatingPhotos = false
                }
                switch result{
                    case .Success(let jsonObject):
                        let json = JSON(jsonObject)
                    
                        if (json["meta"]["code"].intValue  == 200) {
                            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
                                if let urlString = json["pagination"]["next_url"].URL {
                                    self.nextURLRequest = NSURLRequest(URL: urlString)
                                } else {
                                    self.nextURLRequest = nil
                                }
                                let photos = json["data"].arrayValue
                                    
                                    .filter {
                                        $0["type"].stringValue == "image"
                                    }.map({
                                        Photo(sourceImageURL: $0["images"]["standard_resolution"]["url"].URL!)
                                    })
                                
                                let lastItem = self.photos.count
                                self.photos.appendContentsOf(photos)
                                
                                let indexPaths = (lastItem..<self.photos.count).map { NSIndexPath(forItem: $0, inSection: 0) }
                                
                                dispatch_async(dispatch_get_main_queue()) {
                                    self.tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
                                }
                                
                            }
                    }
                    
                    case .Failure(let error):
                        print(error)
                }
        }
        
        
    }

}
