//
//  FeedViewController.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 10/30/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feed"
        
        let leftBarButton = UIBarButtonItem(title: "premium", style: .Plain, target: self, action: "tappedLeftBarButton")
        let rightBarButton = UIBarButtonItem(title: "Setting", style: .Plain, target: self, action: "tappedRightBarButton")
        
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.barTintColor = UIColor.mainColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tappedRightBarButton() {
//        let nextPage = FormSettingViewController(coder: NSCoder())
//        self.navigationController?.pushViewController(nextPage!, animated: true)
    }

}
