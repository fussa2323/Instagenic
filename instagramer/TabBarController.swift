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
    
    //---------------------------
    // MARK: Life-cycle
    //---------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if realm.objects(User).isEmpty {
            isLogin = false
        } else {
            print("Logged in!")
            self.user = realm.objects(User)[3]
            print("Login user : \(self.user)")
        }
        
        //logout nortificationの登録
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "logout:", name: "logout", object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.checkLoginStatus()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //---------------------------
    // MARK: Login/Logout
    //---------------------------
    
    func checkLoginStatus(){
        if !isLogin {
            self.segueToFirstLaunch()
            isLogin = !isLogin
        }
    }
    
    func logout() {
        for i in 0...realm.objects(User).count{
            do {
                let user = realm.objects(User)[i]
                try realm.write({ () -> Void in
                    self.realm.delete(user)
                })
            }
            catch {
                print("Realm delete error...")
            }
        }
        self.checkLoginStatus()
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
