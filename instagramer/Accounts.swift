//
//  Accounts.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 11/22/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Accounts: Object{
    var instagramId: String = ""
    var accessToken: String = ""
    var userName: String = ""
    var profileImage: String = ""
    
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
}

// MARK: - ObjectMapper
extension Accounts : Mappable {
    
    func mapping(map: Map) {
        instagramId <- map["instagramId"]
        accessToken <- map["accessToken"]
        userName <- map["userName"]
        profileImage <- map["profileImage"]
    }
    
}