//
//  Instagram.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 10/16/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import Alamofire
import UIKit

struct Instagram {
    enum Router: URLRequestConvertible{
        static let baseURLString = "https://api.instagram.com"
        static let clientID = "b4332c7fc1da41ce92d7b60ff668f32a"
        static let redirectURI = "http://www.example.com/"
        static let clientSecret = "e7099308c8fa43c29a2afd66e2266c7a"
        
        case PopularPhotos(String, String) //ユーザが公開しているうちもっとも新しいメディアを取得する
        case GetPopularPhoto(String) //ポピュラー写真を取得
        case GetUserInfo(String, String) //Userの基本情報を取得
        case GetUserFeed(String, String, String, String) //UserのFeedを取得
        case GetUserBySearch(String, String) //ユーザを名前で検索する
        case requestOauthCode
        
        var URLRequest: NSMutableURLRequest {
            let result: (path: String, parameters: [String: AnyObject]?) = {
                switch self {
                case .PopularPhotos (let userID, let accessToken):
                    let params = ["access_token": accessToken]
                    let pathString = "/v1/users/" + userID + "/media/recent"
                    return (pathString, params)
                    
                case .GetPopularPhoto(let accessToken):
                    let params = ["access_token": accessToken]
                    let pathString = "/vi/media/popular/?client_id=" + Router.clientID
                    return (pathString, params)
                
                case .GetUserInfo(let userID, let accessToken):
                    let params = ["access_token": accessToken]
                    let pathString = "/vi/users/" + userID + "/media/recent"
                    return (pathString, params)
                
                case .GetUserFeed(let userID, let accessToken, let maxID, let minID):
                    let params = ["access_token": accessToken, "max_id": maxID, "min_id": minID]
                    let pathString = "/vi/users/" + userID + "/feed"
                    return (pathString, params)
                    
                case .GetUserBySearch(let q, let accessToken):
                    let params = ["q": q, "access_token": accessToken]
                    let pathString = "/vi/users/search"
                    return (pathString, params)
                    
                case .requestOauthCode:
                    let pathString = "/oauth/authorize/?client_id=" + Router.clientID + "&redirect_uri=" + Router.redirectURI + "&response_type=code"
                    return (pathString, nil)
                }
                }()
            
            let BaeseURL = NSURL(string: Router.baseURLString)!
            let URLRequest = NSURLRequest(URL: BaeseURL.URLByAppendingPathComponent(result.path))
            let encoding = Alamofire.ParameterEncoding.URL
            return encoding.encode(URLRequest, parameters: result.parameters).0
        }
        
        static func requestAccessTokenURLStringAndParms(code: String) -> (URLString: String, Params: [String: AnyObject]) {
            let params = ["client_id": Router.clientID, "client_secret": Router.clientSecret, "grant_type": "authorization_code", "redirect_uri": Router.redirectURI, "code": code]
            let pathString = "/oauth/access_token"
            let urlString = Instagram.Router.baseURLString + pathString
            return (urlString, params)
        }

    }
}

extension Alamofire.Request {
    class func imageResponseSerializer() -> GenericResponseSerializer<UIImage> {
        return GenericResponseSerializer { request, response, data in
            guard let validData = data where validData.length > 0 else {
                return .Failure(data, Request.imageDataError())
            }
            
            if let image = UIImage(data: validData, scale: UIScreen.mainScreen().scale) {
                return Result<UIImage>.Success(image)
            }
            else {
                return .Failure(data, Request.imageDataError())
            }
            
        }
    }
    
    func responseImage(completionHandler: (NSURLRequest?, NSHTTPURLResponse?, Result<UIImage>) -> Void) -> Self {
        return response(responseSerializer: Request.imageResponseSerializer(), completionHandler: completionHandler)
    }
    
    private class func imageDataError() -> NSError {
        let failureReason = "Failed to create a valid Image from the response data"
        return Error.errorWithCode(NSURLErrorCannotDecodeContentData, failureReason: failureReason)
    }

}