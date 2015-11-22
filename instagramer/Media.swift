//
//  Media.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 11/22/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Media: Object{
    var mediaId: String = ""
    var imageUrl: String = ""
    
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
}

// MARK: - ObjectMapper
extension Media : Mappable {
    
    func mapping(map: Map) {
        mediaId <- map["mediaId"]
        imageUrl <- map["imageUrl"]
    }
    
}