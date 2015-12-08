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
    let accessToken: String? = CurrentAccount.sharedController.account?.accessToken
    let instagramId: String?  = CurrentAccount.sharedController.account?.instagramId
    var photos = [Photo]()
    let refreshControl = UIRefreshControl()
    var populatingPhotos = false
    var nextURLRequest: NSURLRequest?
    let formatName = FSBigImageFormatName
    
    //--------------------
    // MARK: Life-cycle
    //--------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.loadFeedData()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        self.loadFeedData()
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
        let sharedImageCache = FICImageCache.sharedImageCache()
        cell.mainImage.image = nil
        let photo = photos[indexPath.row] as Photo
        
        if (cell.photo != photo) {
            sharedImageCache.cancelImageRetrievalForEntity(cell.photo, withFormatName: formatName)
            cell.photo = photo
            print(photo)
        }
        
//        sharedImageCache.retrieveImageForEntity(photo, withFormatName: formatName, completionBlock: {
//            (photo, _, image) -> Void in
//            if (photo as! Photo) == cell.photo {
//                cell.profilePicture.image = image
//            }
//        })
//        
//        cell.mainImage.image = UIImage(named: "Imaeg-2")
//        cell.profilePicture.image = UIImage(named: "Image-2")
        
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
        
        guard let instagramId = self.instagramId, accessToken = self.accessToken else{
            return
        }
        
        Alamofire.request(Instagram.Router.PopularPhotos(instagramId, accessToken))
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
                                    self.tableView.reloadData()
                                }
                                
                            }
                    }
                    
                    case .Failure(let error):
                        print(error)
                }
        }
        
        
    }

}
