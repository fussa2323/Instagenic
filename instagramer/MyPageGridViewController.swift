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

class MyPageGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var images = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5", "Image-6", "Image-7", "Image-8", "Image-9"]
    let formatName = KMSmallImageFormatName
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
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //-------------------------------------------
    // MARK: UICollectionViewDelegate Protocol
    //-------------------------------------------

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:GridCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("GridCell", forIndexPath: indexPath) as! GridCollectionViewCell
        let imageName = images[indexPath.row]
        cell.image.image = UIImage(named: imageName)
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var size = CGSizeZero
        size = CGSize(width: 110, height: 110)
        return size
    }
    
    //-------------------------------------------
    // MARK: UICollectionView Setup
    //-------------------------------------------
    
    func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = (view.bounds.size.width - 2) / 3
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.minimumInteritemSpacing = 1.0
        layout.minimumLineSpacing = 1.0
        layout.footerReferenceSize = CGSize(width: collectionView!.bounds.size.width, height: 100.0)
        collectionView!.collectionViewLayout = layout
    }
    
    func setupView() {
        setupCollectionViewLayout()
        collectionView!.registerClass(GridCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: GridViewCellIdentifier)
        collectionView!.registerClass(GridLoadingCollectionView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: GridViewFooterViewIdentifier)
        
        refreshControl.tintColor = UIColor.whiteColor()
        refreshControl.addTarget(self, action: "handleRefresh", forControlEvents: .ValueChanged)
        collectionView!.addSubview(refreshControl)
    }
    

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
