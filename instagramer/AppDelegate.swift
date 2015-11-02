//
//  AppDelegate.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 10/16/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let realm = try! Realm()
    
//    var tabbarController: UITabBarController?
//    var navigationController1: UINavigationController?
//    var navigationController2: UINavigationController?
//    var navigationController3: UINavigationController?
//    var navigationController4: UINavigationController?
//    var navigationController5: UINavigationController?
//    var storyboard: UIStoryboard = UIStoryboard()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Show realm path for Realm Browser.
        print(realm.path)
        
//        // set up 1st tab page "Feed"
//        storyboard = UIStoryboard(name: "Feed", bundle: NSBundle.mainBundle())
//        let feedViewController: UIViewController = storyboard.instantiateInitialViewController()!
//        self.navigationController1 = UINavigationController(rootViewController: feedViewController)
//        
//        let feedTabbarItem = UITabBarItem(title: "Feed", image: nil, selectedImage: nil)
//        self.navigationController1?.tabBarItem = feedTabbarItem
//        
//        // set up 2nd tab page "Search"
//        storyboard = UIStoryboard(name: "Search", bundle: NSBundle.mainBundle())
//        let searchViewController: UIViewController = storyboard.instantiateInitialViewController()!
//        self.navigationController2 = UINavigationController(rootViewController: searchViewController)
//        
//        let SearchTabbarItem = UITabBarItem(title: "Search", image: nil, selectedImage: nil)
//        self.navigationController2?.tabBarItem = SearchTabbarItem
//        
//        // set up 3rd tab page "Album"
//        storyboard = UIStoryboard(name: "Album", bundle: NSBundle.mainBundle())
//        let albumViewController: UIViewController = storyboard.instantiateInitialViewController()!
//        self.navigationController3 = UINavigationController(rootViewController: albumViewController)
//        
//        let albumTabbarItem = UITabBarItem(title: "Album", image: nil, selectedImage: nil)
//        self.navigationController3?.tabBarItem = albumTabbarItem
//        
//        // set up 4th tab page "HashTag"
//        storyboard = UIStoryboard(name: "HashTag", bundle: NSBundle.mainBundle())
//        let hashTagViewController: UIViewController = storyboard.instantiateInitialViewController()!
//        self.navigationController4 = UINavigationController(rootViewController: hashTagViewController)
//        
//        let hashTagTabbarItem = UITabBarItem(title: "HashTag", image: nil, selectedImage: nil)
//        self.navigationController4?.tabBarItem = hashTagTabbarItem
//        
//        // set up 5th tab page "MyPage"
//        storyboard = UIStoryboard(name: "MyPage", bundle: NSBundle.mainBundle())
//        let myPageViewController: UIViewController = storyboard.instantiateInitialViewController()!
//        self.navigationController5 = UINavigationController(rootViewController: myPageViewController)
//        
//        let myPageTabbarItem = UITabBarItem(title: "myPage", image: nil, selectedImage: nil)
//        self.navigationController5?.tabBarItem = myPageTabbarItem
//        
//        // set up tab bar controller
//        storyboard = UIStoryboard(name: "TabBar", bundle: NSBundle.mainBundle())
//        tabbarController = storyboard.instantiateInitialViewController() as? UITabBarController
//        tabbarController?.setViewControllers(NSArray(objects: navigationController1!, navigationController2!, navigationController3!, navigationController4!, navigationController5!) as? [UIViewController], animated: false)
//        
//        
//        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        self.window?.rootViewController = tabbarController
//        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }


}

