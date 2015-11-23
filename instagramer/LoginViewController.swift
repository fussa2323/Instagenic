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

        
    }
    
    func unwindToTopPage() {
        let storyboard: UIStoryboard = UIStoryboard(name: "TabBar", bundle: nil)
        let TabBarController = storyboard.instantiateViewControllerWithIdentifier("TabBar")
        TabBarController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(TabBarController, animated: true, completion: nil)
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
                    
                    if let accessToken = json["access_token"].string, instagramId = json["user"]["id"].string, userName = json["user"]["username"].string, profileImage = json["user"]["profile_picture"].string  {
                        let dic = ["accessToken": accessToken, "instagramId": instagramId, "userName": userName, "profileImage": profileImage, "isLastUsed": true]
                        let account = Mapper<Accounts>().map(dic)
                        do {
                            let realm = try Realm()
                            try realm.write({ () -> Void in
                                realm.add(account!)
                                print("\(account?.accessToken) : \(account?.instagramId)")
                            })
                        }
                        catch {
                            print("Realm save error...")
                        }
                        
                        //現在のアカウントに設定
                        CurrentAccount.sharedController.account = account!
                        
                        self.unwindToTopPage()
//                        self.performSegueWithIdentifier("unwindToPhotoBrowser", sender: ["user": dic])
//                        self.dismissViewControllerAnimated(true, completion: nil)
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


