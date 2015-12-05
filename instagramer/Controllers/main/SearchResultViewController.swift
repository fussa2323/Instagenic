//
//  SearchResultViewController.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 12/1/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController, UISearchBarDelegate {

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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //---------------------------
    // MARK: UISearchBar
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
