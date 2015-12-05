//
//  InstagramApiClient.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 11/23/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import Foundation
import APIKit
import Himotoki
import SwiftyJSON

protocol InstagramRequestType: RequestType {
    
}

extension InstagramRequestType {
    var baseURL: NSURL {
        return NSURL(string: "https://api.instagram.com")!
    }
}

struct GetUserInfoRequest: InstagramRequestType {
    typealias Response = UserInfo
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "/v1/users/\(CurrentAccount.sharedController.account!.instagramId)/?access_token=\(CurrentAccount.sharedController.account!.accessToken)"
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
        guard let dictionary = object as? [String: AnyObject] else {
            return nil
        }
        
        guard let userInfo = UserInfo(dictionary: dictionary) else {
            return nil
        }
        
        return userInfo
    }
}

struct UserInfo {
    var instagramId: String = ""
    var userName: String = ""
    var profileImage: String = ""
    var isLastUsed: Bool = false
    
    init?(dictionary: [String: AnyObject]) {
//        guard let instagramId = dictionary["data"]["id"] as? Int else {
//            throw APIError.ConnectionError(NSError)
//        }
//        
//        guard let userName = dictionary["data"]["username"] as? Int else {
//            return nil
//        }
//        
//        guard let resetDateString = dictionary["rate"]?["reset"] as? NSTimeInterval else {
//            return nil
//        }
//        
//        self.instagramId = instagramId
//        self.resetDate = NSDate(timeIntervalSince1970: resetDateString)
    }
}


enum InitializationError: ErrorType {
    case instagramId
}


