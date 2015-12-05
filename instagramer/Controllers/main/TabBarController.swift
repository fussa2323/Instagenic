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

    var isLogin = true
    var currentAccount: Accounts?
    
    //---------------------------
    // MARK: Life-cycle
    //---------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentAccount = CurrentAccount.sharedController.account
        
//        if currentAccount != nil{
//            print("Logged in!")
//            print("Login user : \(currentAccount)")
//            isLogin = true
//        } else {
//            isLogin = false
//        }
        
        //logout nortificationの登録
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "logout", name: "logout", object: nil)
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
        }
    }
    
    func logout(){
        
        if let instagramId = CurrentAccount.sharedController.account?.instagramId{
            let realm = try! Realm()
        
            do {
                try realm.write({ () -> Void in
                    let query = realm.objects(Accounts).filter("instagramId = '\(instagramId)'")
                    realm.delete(query)
                    self.currentAccount = nil
                })
            }
            catch {
                print("Realm delete error...")
            }
        
        if realm.objects(Accounts).isEmpty{
            self.isLogin = false
            self.checkLoginStatus()
        } else {
            CurrentAccount.sharedController.account = realm.objects(Accounts)[0]
        }
        }
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
