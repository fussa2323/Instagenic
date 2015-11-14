//
//  MyPageViewController.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 10/30/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    
    
    @IBOutlet weak var segmentedControll: UISegmentedControl!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MyPage"
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        self.firstView.hidden = false
        self.secondView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func indexChanged(sender: AnyObject) {
        switch segmentedControll.selectedSegmentIndex {
        case 0:
            firstView.hidden = false
            secondView.hidden = true
        case 1:
            firstView.hidden = true
            secondView.hidden = false
        default:
            break
        }
    }
    
    //---------------------------
    // MARK: Login/Logout
    //---------------------------
    
    @IBAction func logoutButtonAction(sender: AnyObject) {
        //TabBaControllerのlogoutメソッドの呼び出し
        let n : NSNotification = NSNotification(name: "logout", object: self)
        NSNotificationCenter.defaultCenter().postNotification(n)
    }
    
}
