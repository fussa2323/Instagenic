//
//  Album.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 11/22/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Album: Object{
    var instagramId: String = ""
    var title: String = ""
    var medias = List<Media>()
    
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
}

// MARK: - ObjectMapper
extension Album : Mappable {
    
    func mapping(map: Map) {
        instagramId <- map["instagramId"]
        title <- map["title"]
    }
    
}
