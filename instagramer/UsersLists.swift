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

class UsersLists: Object{
    var instagramId: String = ""
    var listName: String = ""
    var userIds: [User] = []
    var order: Int = 0
    
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
}

// MARK: - ObjectMapper
extension UsersLists : Mappable {
    
    func mapping(map: Map) {
        instagramId <- map["instagramId"]
        listName <- map["listName"]
        userIds <- map["userIds"]
        order <- map["order"]
    }
    
}
