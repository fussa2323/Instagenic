//
//  TabBarController.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 10/17/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    let NSUSERDEFAULT_FIRST_TIME = "isFirstTimeDone"
    var isLogin = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.segueToFirstLaunch()
        
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
        self.presentViewController(firstLaunchViewController, animated: true, completion: nil)
    }
}
