//
//  mutedUsers.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 11/22/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class MutedUsers: Object{
    var instagramId: String = ""
    var userIds: List<User> = List<User>()
    
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
}

// MARK: - ObjectMapper
extension MutedUsers : Mappable {
    
    func mapping(map: Map) {
        instagramId <- map["instagramId"]
    }
    
}