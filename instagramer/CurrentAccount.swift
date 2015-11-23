//
//  CurrentAccount.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 11/23/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import Foundation

class CurrentAccount: NSObject
{
    // singleton
    static let sharedController = CurrentAccount()
    var account: Accounts?
    
    private override init() {
        account = nil
    }

}