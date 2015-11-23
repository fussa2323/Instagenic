//
//  usersLists.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 11/22/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class UserLists: Object{
    var instagramId: String = ""
    var listName: String = ""
    var userIds: List<User> = List<User>()
    var order: Int = 0
    
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
}

// MARK: - ObjectMapper
extension UserLists : Mappable {
    
    func mapping(map: Map) {
        instagramId <- map["instagramId"]
        listName <- map["listName"]
        order <- map["order"]
    }
    
}
