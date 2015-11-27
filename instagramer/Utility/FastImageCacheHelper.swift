//
//  FastImageCacheHelper.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 11/15/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import Foundation

import Foundation
import UIKit
import FastImageCache

let KMPhotoImageFormatFamily = "KMPhotoImageFormatFamily"
let KMSmallImageFormatName = "KMSmallImageFormatName"
let KMBigImageFormatName = "KMBigImageFormatName"

var KMSmallImageSize: CGSize {
    let width = (UIScreen.mainScreen().bounds.size.width - 2) / 3
    return CGSize(width: width, height: width)
}

var KMBigImageSize: CGSize {
    let width = UIScreen.mainScreen().bounds.size.width * 2
    return CGSize(width: width, height: width)
}

class FastImageCacheHelper {
    
    class func setUp(delegate: FICImageCacheDelegate) {
        var imageFormats = [AnyObject]()
        let squareImageFormatMaximumCount = 400;
        let smallImageFormat = FICImageFormat(name: KMSmallImageFormatName, family: KMPhotoImageFormatFamily, imageSize: KMSmallImageSize, style: .Style32BitBGRA, maximumCount: squareImageFormatMaximumCount, devices: .Phone, protectionMode: .None)
        imageFormats.append(smallImageFormat)
        
        let bigImageFormat = FICImageFormat(name: KMBigImageFormatName, family: KMPhotoImageFormatFamily, imageSize: KMBigImageSize, style: .Style32BitBGRA, maximumCount: squareImageFormatMaximumCount, devices: .Phone, protectionMode: .None)
        imageFormats.append(bigImageFormat)
        
        let sharedImageCache = FICImageCache.sharedImageCache()
        sharedImageCache.delegate = delegate
        sharedImageCache.setFormats(imageFormats)
    }
}