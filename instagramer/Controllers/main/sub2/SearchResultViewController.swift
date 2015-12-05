//
//  SearchResultViewController.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 12/1/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit
import PagingMenuController

class SearchResultViewController: UIViewController, UISearchBarDelegate, PagingMenuControllerDelegate {

    let uiSearchBar : UISearchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UISearchBar Config---------------
        uiSearchBar.delegate = self
        uiSearchBar.text = "" // 表示するテキストを設定(入力済みにする)
        uiSearchBar.prompt = "" // サーチバーのタイトルを設定する。
        uiSearchBar.placeholder = "検索" // プレスフォルダーを設定する。
        uiSearchBar.showsCancelButton = false // キャンセルボタン表示を設定(クリアボタン)
        uiSearchBar.showsSearchResultsButton = false // 検索結果表示ボタン表示を設定
        uiSearchBar.keyboardType = UIKeyboardType.Default // テキスト入力時のキーボードのスタイルを設定
        uiSearchBar.searchBarStyle = UISearchBarStyle.Minimal // バースタイルをDefaultに設定する.
        uiSearchBar.barStyle = UIBarStyle.Default // 検索バーのスタイルを設定
        uiSearchBar.tintColor = UIColor.whiteColor() // 検索バー全体の色を設定
        
        self.navigationItem.titleView = uiSearchBar
        self.navigationItem.titleView!.frame = CGRectMake(0, 0, 320, 44);
        // UISearchBar Config----------------
       
        // PagingMenuController Setup
        let SearchResultMainViewController = self.storyboard?.instantiateViewControllerWithIdentifier("main") as! SearchResultMainViewController
        SearchResultMainViewController.title = "上位検索結果"
        let SearchResultPeopleViewController = self.storyboard?.instantiateViewControllerWithIdentifier("people") as! SearchResultPeopleViewController
        SearchResultPeopleViewController.title = "ピープル"
        let SearchResultTagsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("tags") as! SearchResultTagsViewController
        SearchResultTagsViewController.title = "タグ"
        let SearchResultSpotViewController = self.storyboard?.instantiateViewControllerWithIdentifier("tags") as! SearchResultSpotViewController
        SearchResultSpotViewController.title = "スポット"
        let viewControllers = [SearchResultMainViewController, SearchResultPeopleViewController, SearchResultTagsViewController, SearchResultSpotViewController]
        
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
    
    //---------------------------
    // MARK: UISearchBarDelegate
    //---------------------------
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        self.uiSearchBar.setShowsCancelButton(true, animated: true)
        return true
    }
}
