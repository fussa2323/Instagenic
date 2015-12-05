//
//  FeedViewController.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 10/30/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit
import PagingMenuController

class FeedViewController: UIViewController, PagingMenuControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feed"
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        //PagingMenuController Setup
        let feedListItemViewController1 = self.storyboard?.instantiateViewControllerWithIdentifier("FeedListItem") as! FeedListItemViewController
        feedListItemViewController1.title = "list1"
        let feedListItemViewController2 = self.storyboard?.instantiateViewControllerWithIdentifier("FeedListItem") as! FeedListItemViewController
        feedListItemViewController2.title = "list2"
        let feedListItemViewController3 = self.storyboard?.instantiateViewControllerWithIdentifier("FeedListItem") as! FeedListItemViewController
        feedListItemViewController3.title = "list3"
        let viewControllers = [feedListItemViewController1, feedListItemViewController2, feedListItemViewController3]
        
        let options = PagingMenuOptions()
        options.menuHeight = 28
        options.menuDisplayMode = .Standard(widthMode: .Flexible, centerItem: false, scrollingMode: .PagingEnabled)
        options.textColor = UIColor.textColor()
        options.selectedTextColor = UIColor.mainColor()
        
        let pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.delegate = self
        pagingMenuController.setup(viewControllers: viewControllers, options: options)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tappedRightBarButton() {
    }
    
    //---------------------------------------
    // MARK: - PagingMenuControllerDelegate
    //---------------------------------------
    
    func willMoveToMenuPage(page: Int) {
    }
    
    func didMoveToMenuPage(page: Int) {
    }

}
