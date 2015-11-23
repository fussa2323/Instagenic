//
//  AppDelegate.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 10/16/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // --Realm Migration--
//        let config = Realm.Configuration(
//            // 新しいスキーマバージョンを設定します。以前のバージョンより大きくなければなりません。
//            // （スキーマバージョンを設定したことがなければ、最初は0が設定されています）
//            schemaVersion: 2,
//            
//            // マイグレーション処理を記述します。古いスキーマバージョンのRealmを開こうとすると
//            // 自動的にマイグレーションが実行されます。
//            migrationBlock: { migration, oldSchemaVersion in
//                // 最初のマイグレーションの場合、`oldSchemaVersion`は0です
//                if (oldSchemaVersion < 2) {
//                    // 何もする必要はありません！
//                    // Realmは自動的に新しく追加されたプロパティと、削除されたプロパティを認識します。
//                    // そしてディスク上のスキーマを自動的にアップデートします。
//                }
//        })
//        
//        // デフォルトRealmに新しい設定を適用します
//        Realm.Configuration.defaultConfiguration = config
//        // Realmファイルを開こうとしたときスキーマバージョンが異なれば、
//        // 自動的にマイグレーションが実行されます
//        
//        let realm = try! Realm()
//        print(realm.path)
        // --Realm Migration--
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }


}

