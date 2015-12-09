//
//  MyPageGridViewController.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 11/3/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON
import Alamofire
import FastImageCache

//class MyPageGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
class MyPageGridViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let formatName = FSSmallImageFormatName
    var photos = [Photo]()
    let refreshControl = UIRefreshControl()
    var nextURLRequest = NSURLRequest?()
    let GridViewCellIdentifier = "GridViewCell"
    let GridViewFooterViewIdentifier = "GridViewFooterView"
    
    
    //---------------------------
    // MARK: Life - Cycle
    //---------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.delegate = self
//        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //-------------------------------------------
    // MARK: UICollectionViewDelegate Protocol
    //-------------------------------------------
//
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell:GridCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("GridCell", forIndexPath: indexPath) as! GridCollectionViewCell
//
//        return cell
//    }
//    
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 0
//    }
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        
//        var size = CGSizeZero
//        size = CGSize(width: 110, height: 110)
//        return size
//    }
//    
//    //-------------------------------------------
//    // MARK: UICollectionView Setup
//    //-------------------------------------------
//    
//    func setupCollectionViewLayout() {
//        let layout = UICollectionViewFlowLayout()
//        let itemWidth = (view.bounds.size.width - 2) / 3
//        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
//        layout.minimumInteritemSpacing = 1.0
//        layout.minimumLineSpacing = 1.0
//        layout.footerReferenceSize = CGSize(width: collectionView!.bounds.size.width, height: 100.0)
//        collectionView!.collectionViewLayout = layout
//    }
//    
//    func setupView() {
//        setupCollectionViewLayout()
//        collectionView!.registerClass(GridCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: GridViewCellIdentifier)
//        collectionView!.registerClass(GridLoadingCollectionView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: GridViewFooterViewIdentifier)
//        
//        refreshControl.tintColor = UIColor.whiteColor()
//        refreshControl.addTarget(self, action: "handleRefresh", forControlEvents: .ValueChanged)
//        collectionView!.addSubview(refreshControl)
//    }
//    
//    //-------------------------------------------
//    // MARK:  Other Functions
//    //-------------------------------------------
//    
//    func handleRefresh() {
//        nextURLRequest = nil
//        refreshControl.beginRefreshing()
//        self.photos.removeAll(keepCapacity: false)
//        self.collectionView!.reloadData()
//        refreshControl.endRefreshing()
//        if user != nil {
//            let request = Instagram.Router.PopularPhotos(user!.userID, user!.accessToken)
//            populatePhotos(request)
//        }
//    }
//    
//    func populatePhotos(request: URLRequestConvertible) {
//        
//        if populatingPhotos {
//            return
//        }
//        
//        populatingPhotos = true
//        
//        Alamofire.request(request).responseJSON() {
//            (_ , _, result) in
//            defer {
//                self.populatingPhotos = false
//            }
//            switch result {
//            case .Success(let jsonObject):
//                //debugPrint(jsonObject)
//                let json = JSON(jsonObject)
//                
//                if (json["meta"]["code"].intValue  == 200) {
//                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
//                        if let urlString = json["pagination"]["next_url"].URL {
//                            self.nextURLRequest = NSURLRequest(URL: urlString)
//                        } else {
//                            self.nextURLRequest = nil
//                        }
//                        let photoInfos = json["data"].arrayValue
//                            
//                            .filter {
//                                $0["type"].stringValue == "image"
//                            }.map{(
//                                PhotoInfo(sourceImageURL: $0["images"]["standard_resolution"]["url"].URL!)
//                            })
//                        
//                        let lastItem = self.photos.count
//                        self.photos.appendContentsOf(photoInfos)
//                        
//                        let indexPaths = (lastItem..<self.photos.count).map { NSIndexPath(forItem: $0, inSection: 0) }
//                        
//                        dispatch_async(dispatch_get_main_queue()) {
//                            self.collectionView!.insertItemsAtIndexPaths(indexPaths)
//                        }
//                        
//                    }
//                    
//                }
//            case .Failure:
//                break;
//            }
//            
//        }
//    }
//
    

}

class GridLoadingCollectionView: UICollectionReusableView {
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        spinner.startAnimating()
        spinner.center = self.center
        addSubview(spinner)
    }
}
