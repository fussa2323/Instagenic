 //
//  LoginViewController.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 10/16/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit
import Foundation
import Realm
import RealmSwift
import Alamofire
import SwiftyJSON
import ObjectMapper

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        webView.hidden = true
        NSURLCache.sharedURLCache().removeAllCachedResponses()
        if let cookies = NSHTTPCookieStorage.sharedHTTPCookieStorage().cookies {
            for cookie in cookies {
                NSHTTPCookieStorage.sharedHTTPCookieStorage().deleteCookie(cookie)
            }
        }
        
        let request = NSURLRequest(URL: Instagram.Router.requestOauthCode.URLRequest.URL!, cachePolicy: .ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        self.webView.loadRequest(request)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            let TabbarController = segue.destinationViewController as! TabBarController
            if let dic = sender?.valueForKey("user") {
                let user = Mapper<User>().map(dic)
                TabbarController.user = user
        }
    }
    
}

extension LoginViewController: UIWebViewDelegate {
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        debugPrint(request.URLString)
        let urlString = request.URLString
        if let range = urlString.rangeOfString(Instagram.Router.redirectURI + "?code=") {
            
            let location = range.endIndex
            let code = urlString.substringFromIndex(location)
            debugPrint(code)
            requestAccessToken(code)
            return false
        }
        return true
    }
    
    func requestAccessToken(code: String) {
        let request = Instagram.Router.requestAccessTokenURLStringAndParms(code)
        
        Alamofire.request(.POST, request.URLString, parameters: request.Params)
            .responseJSON {
                (_, response, result) in
                switch result {
                case .Success(let jsonObject):
                    let json = JSON(jsonObject)
                    
                    if let accessToken = json["access_token"].string, userID = json["user"]["id"].string {
                        let dic = ["access_token": accessToken, "userID": userID]
                        let user = Mapper<User>().map(dic)
                        
                        do {
                            let realm = try Realm()
                            try realm.write({ () -> Void in
                                realm.add(user!)
                                print("\(user?.accessToken) : \(user?.userID)")
                            })
                        }
                        catch {
                            print("Realm save error...")
                        }
                        
//                        self.performSegueWithIdentifier("unwindToPhotoBrowser", sender: ["user": user])
                        self.dismissViewControllerAnimated(true, completion: nil)
                        
                    }
                case .Failure:
                    break;
                }
        }
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        webView.hidden = false
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
    }
}


