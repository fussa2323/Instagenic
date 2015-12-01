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
        
        // サーチバーを作成する。
        let uiSearchBar : UISearchBar = UISearchBar()
        // 表示する位置と大きさを設定
        uiSearchBar.frame = CGRectMake(0,0,300,80)
        // デリゲートの設定先を設定
        uiSearchBar.delegate = self
        // 表示するテキストを設定(入力済みにする)
        uiSearchBar.text = ""
        // サーチバーのタイトルを設定する。
        uiSearchBar.prompt = ""
        // プレスフォルダーを設定する。
        uiSearchBar.placeholder = "検索"
        // キャンセルボタン表示を設定(クリアボタン)
        uiSearchBar.showsCancelButton = true
        // ブックマークボタン表示を設定
        uiSearchBar.showsBookmarkButton = false
        // 検索結果表示ボタン表示を設定
        uiSearchBar.showsSearchResultsButton = false
        // テキスト入力時のキーボードのスタイルを設定
        uiSearchBar.keyboardType = UIKeyboardType.Default
        // バースタイルをDefaultに設定する.
        uiSearchBar.searchBarStyle = UISearchBarStyle.Minimal
        // 検索バーのスタイルを設定
        uiSearchBar.barStyle = UIBarStyle.Default
        // 検索バー全体の色を設定
        uiSearchBar.tintColor = UIColor.mainColor()
        
        // UINavigationBar上に、UISearchBarを追加
        self.navigationItem.titleView = uiSearchBar
        self.navigationItem.titleView!.frame = CGRectMake(0, 0, 320, 44);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
