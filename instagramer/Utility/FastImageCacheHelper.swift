//
//  FastImageCacheHelper.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 11/15/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import Foundation
import UIKit
import FastImageCache

let FSPhotoImageFormatFamily = "FSPhotoImageFormatFamily"
let FSSmallImageFormatName = "FSSmallImageFormatName"
let FSBigImageFormatName = "FSBigImageFormatName"

var FSSmallImageSize: CGSize {
    let width = (UIScreen.mainScreen().bounds.size.width - 2) / 3
    return CGSize(width: width, height: width)
}

var FSBigImageSize: CGSize {
    let width = UIScreen.mainScreen().bounds.size.width * 2
    return CGSize(width: width, height: width)
}

class FastImageCacheHelper {
    
    class func setUp(delegate: FICImageCacheDelegate) {
        var imageFormats = [AnyObject]()
        let squareImageFormatMaximumCount = 400;
        let smallImageFormat = FICImageFormat(name: FSSmallImageFormatName, family: FSPhotoImageFormatFamily, imageSize: FSSmallImageSize, style: .Style32BitBGRA, maximumCount: squareImageFormatMaximumCount, devices: .Phone, protectionMode: .None)
        imageFormats.append(smallImageFormat)
        
        let bigImageFormat = FICImageFormat(name: FSBigImageFormatName, family: FSPhotoImageFormatFamily, imageSize: FSBigImageSize, style: .Style32BitBGRA, maximumCount: squareImageFormatMaximumCount, devices: .Phone, protectionMode: .None)
        imageFormats.append(bigImageFormat)
        
        let sharedImageCache = FICImageCache.sharedImageCache()
        sharedImageCache.delegate = delegate
        sharedImageCache.setFormats(imageFormats)
    }
}