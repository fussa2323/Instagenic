//
//  MyPageViewController.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 10/30/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit
import SDWebImage

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var segmentedControll: UISegmentedControl!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = CurrentAccount.sharedController.account?.userName
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        //profileImage
        profileImage.layer.cornerRadius = 42.5
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderColor = UIColor.mainColor().CGColor
        profileImage.layer.borderWidth = 2
        
        self.firstView.hidden = false
        self.secondView.hidden = true
        
        self.loadProfile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadProfile(){
//        let imageURL = NSURL(string: "\(CurrentAccount.sharedController.account?.profileImage)")
//        profileImage.sd_setImageWithURL(imageURL)
        
        let urlString = CurrentAccount.sharedController.account?.profileImage
        print(urlString)
        
        profileImage.sd_setImageWithURL(NSURL(string: urlString!))
        profileImage.contentMode = UIViewContentMode.ScaleAspectFit
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
    @IBAction func firstView(sender: AnyObject) {
        firstView.hidden = false
        secondView.hidden = true
    }
    
    @IBAction func secondView(sender: AnyObject) {
        firstView.hidden = true
        secondView.hidden = false
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
