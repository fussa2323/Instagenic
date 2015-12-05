//
//  GridCollectionViewCell.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 11/4/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {

    let imageView = UIImageView()
    var photo: Photo?
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        
        imageView.frame = self.bounds
        addSubview(imageView)
    }
    
}
