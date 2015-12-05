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
        feedListItemViewController1.title = "FeedList1"
        let feedListItemViewController2 = self.storyboard?.instantiateViewControllerWithIdentifier("FeedListItem") as! FeedListItemViewController
        feedListItemViewController2.title = "FeedList2"
        let feedListItemViewController3 = self.storyboard?.instantiateViewControllerWithIdentifier("FeedListItem") as! FeedListItemViewController
        feedListItemViewController3.title = "FeedList3"
        let viewControllers = [feedListItemViewController1, feedListItemViewController2, feedListItemViewController3]
        
        let options = PagingMenuOptions()
        options.menuHeight = 35
        options.menuDisplayMode = .Standard(widthMode: .Flexible, centerItem: false, scrollingMode: .PagingEnabled)
//        options.menuDisplayMode = .SegmentedControl
//        options.menuDisplayMode = .Infinite(widthMode: .Flexible)
        options.textColor = UIColor.textColor()
        options.selectedTextColor = UIColor.mainColor()
        options.menuItemMode = .Underline(height: 3, color: UIColor.mainColor(), horizontalPadding: 0, verticalPadding: 0)
        
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
