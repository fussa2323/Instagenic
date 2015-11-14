//
//  TabBarController.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 10/17/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit
import Realm
import RealmSwift
import Alamofire
import SwiftyJSON
import ObjectMapper

class TabBarController: UITabBarController {

    let NSUSERDEFAULT_FIRST_TIME = "isFirstTimeDone"
    var isLogin = true
    var user: User?
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if realm.objects(User).isEmpty {
            isLogin = false
        } else {
            print("Logged in!")
            self.user = realm.objects(User)[3]
            print("Login user : \(self.user)")
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if !isLogin {
            self.segueToFirstLaunch()
            isLogin = !isLogin
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //---------------------------
    //# MARK: - Segue
    //---------------------------
    
    func segueToFirstLaunch() {
        let storyboard: UIStoryboard = UIStoryboard(name: "FirstLaunch", bundle: nil)
        let firstLaunchViewController = storyboard.instantiateViewControllerWithIdentifier("FirstLaunch")
        firstLaunchViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(firstLaunchViewController, animated: true, completion: nil)
    }
}
