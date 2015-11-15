//
//  Photo.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 11/15/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RealmSwift
import SDWebImage
import FastImageCache


class Photo: NSObject, FICEntity {
    
    var UUID: String {
        let imageName = sourceImageURL.lastPathComponent!
        let UUIDBytes = FICUUIDBytesFromMD5HashOfString(imageName)
        return FICStringWithUUIDBytes(UUIDBytes)
    }
    
    var sourceImageUUID: String {
        return UUID
    }
    
    var sourceImageURL: NSURL
    var request: Alamofire.Request?
    
    init(sourceImageURL: NSURL) {
        self.sourceImageURL = sourceImageURL
        super.init()
    }

    required override init() {
        fatalError("init() has not been implemented")
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        return (object as! Photo).UUID == self.UUID
    }
    
    func sourceImageURLWithFormatName(formatName: String!) -> NSURL! {
        return sourceImageURL
    }
    
    func drawingBlockForImage(image: UIImage!, withFormatName formatName: String!) -> FICEntityImageDrawingBlock! {
        
        let drawingBlock:FICEntityImageDrawingBlock = {
            (context:CGContextRef!, contextSize:CGSize) in
            var contextBounds = CGRectZero
            contextBounds.size = contextSize
            CGContextClearRect(context, contextBounds)
            
            UIGraphicsPushContext(context)
            image.drawInRect(contextBounds)
            UIGraphicsPopContext()
        }
        return drawingBlock
    }
}
