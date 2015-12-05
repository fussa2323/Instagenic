//
//  FeedListItemViewController.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 12/5/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit
import Alamofire
import FastImageCache
import SwiftyJSON

class FeedListItemViewController: UIViewController, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var photos = [Photo]()
    let refreshControl = UIRefreshControl()
    var populatingPhotos = false
    var nextURLRequest: NSURLRequest?
    
    //--------------------
    // MARK: Life-cycle
    //--------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
//        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //----------------------------
    // MARK: UITableViewDelegate
    //----------------------------
    
    
}
