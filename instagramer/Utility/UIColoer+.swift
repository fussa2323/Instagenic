//
//  UIColoer+.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 10/30/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit

extension UIColor {
    class func mainColor() -> UIColor {
        return UIColor.rgbColor(0x3f729b)
    }
    
    class func textColor() -> UIColor {
        return UIColor.rgbColor(0x5B5C5F)
    }
    
    class func rgbColor(rgbValue: UInt, alpha: Float = 1.0) -> UIColor {
        return UIColor(
            red:   CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >>  8) / 255.0,
            blue:  CGFloat( rgbValue & 0x0000FF)        / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
