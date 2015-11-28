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

protocol InstagramRequestType: RequestType {
    
}

extension InstagramRequestType {
    var baseURL: NSURL {
        return NSURL(string: "https://api.instagram.com")!
    }
}

struct GetRateLimitRequest: InstagramRequestType {
    typealias Response = RateLimit
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "/rate_limit"
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
        guard let dictionary = object as? [String: AnyObject] else {
            return nil
        }
        
        guard let rateLimit = RateLimit(dictionary: dictionary) else {
            return nil
        }
        
        return rateLimit
    }
}

struct RateLimit {
    let count: Int
    let resetDate: NSDate
    
    init?(dictionary: [String: AnyObject]) {
        guard let count = dictionary["rate"]?["limit"] as? Int else {
            return nil
        }
        
        guard let resetDateString = dictionary["rate"]?["reset"] as? NSTimeInterval else {
            return nil
        }
        
        self.count = count
        self.resetDate = NSDate(timeIntervalSince1970: resetDateString)
    }
}