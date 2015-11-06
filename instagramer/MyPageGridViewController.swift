//
//  MyPageGridViewController.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 11/3/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit

class MyPageGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var images = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5", "Image-6", "Image-7", "Image-8", "Image-9"]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UICollectionViewDelegate Protocol
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

}
