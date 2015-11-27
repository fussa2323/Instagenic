//
//  User.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 10/16/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class User: Object{
    var instagramId: String = ""
    var userName: String = ""
    var profileImage: String = ""
    
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
}

// MARK: - ObjectMapper
extension User : Mappable {
    
    func mapping(map: Map) {
        instagramId   <- map["instagramId"]
        userName <- map["userName"]
        profileImage <- map["profileImage"]
    }
    
}