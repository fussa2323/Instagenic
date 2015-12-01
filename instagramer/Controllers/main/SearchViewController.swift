//
//  SearchViewController.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 10/30/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Search"
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        
        // UISearchBar---------------

        let uiSearchBar : UISearchBar = UISearchBar()
        uiSearchBar.frame = CGRectMake(0,0,300,80)
        uiSearchBar.delegate = self
        uiSearchBar.text = "" // 表示するテキストを設定(入力済みにする)
        uiSearchBar.prompt = "" // サーチバーのタイトルを設定する。
        uiSearchBar.placeholder = "検索" // プレスフォルダーを設定する。
        uiSearchBar.showsCancelButton = true // キャンセルボタン表示を設定(クリアボタン)
        uiSearchBar.showsSearchResultsButton = false // 検索結果表示ボタン表示を設定
        uiSearchBar.keyboardType = UIKeyboardType.Default // テキスト入力時のキーボードのスタイルを設定
        uiSearchBar.searchBarStyle = UISearchBarStyle.Minimal // バースタイルをDefaultに設定する.
        uiSearchBar.barStyle = UIBarStyle.Default // 検索バーのスタイルを設定
        uiSearchBar.tintColor = UIColor.mainColor() // 検索バー全体の色を設定
        
        self.navigationItem.titleView = uiSearchBar
        self.navigationItem.titleView!.frame = CGRectMake(0, 0, 320, 44);

        // UISearchBar----------------
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //---------------------------
    // MARK: UISearchBar
    //---------------------------
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        <#code#>
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        <#code#>
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        <#code#>
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        <#code#>
    }
}
