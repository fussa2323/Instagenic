//
//  GridCollectionViewCell.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 11/4/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
