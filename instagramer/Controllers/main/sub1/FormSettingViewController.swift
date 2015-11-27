//
//  FormSettingViewController.swift
//  instagramer
//
//  Created by Yohei Fusayasu on 10/31/15.
//  Copyright © 2015 instagramers. All rights reserved.
//

import UIKit
import Eureka
import CoreLocation

typealias Emoji = String
let 👦🏼 = "👦🏼", 🍐 = "🍐", 💁🏻 = "💁🏻", 🐗 = "🐗", 🐼 = "🐼", 🐻 = "🐻", 🐖 = "🐖", 🐡 = "🐡"

class FormSettingViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        URLRow.defaultCellUpdate = { cell, row in cell.textField.textColor = .blueColor() }
        LabelRow.defaultCellUpdate = { cell, row in cell.detailTextLabel?.textColor = .orangeColor()  }
        CheckRow.defaultCellSetup = { cell, row in cell.tintColor = .orangeColor() }
        DateRow.defaultRowInitializer = { row in row.minimumDate = NSDate() }
        
        form =
            
            Section()
            +++ Section("")
            +++ Section("Feed Setting")
            
            
            <<< LabelRow () {
                $0.title = "LabelRow"
                $0.value = "tap the row"
                }
                .onCellSelection { $0.cell.detailTextLabel?.text? += " 🇺🇾 " }
            
            <<< DateRow() { $0.value = NSDate(); $0.title = "DateRow" }
            
            <<< CheckRow() {
                $0.title = "CheckRow"
                $0.value = true
            }
            
            <<< SwitchRow() {
                $0.title = "SwitchRow"
                $0.value = true
            }
            
            +++ Section("SegmentedRow examples")
            
            <<< SegmentedRow<String>() { $0.options = ["One", "Two", "Three"] }
            
            <<< SegmentedRow<Emoji>(){
                $0.title = "Who are you?"
                $0.options = [💁🏻, 🍐, 👦🏼, 🐗, 🐼, 🐻 ]
                $0.value = 🍐
            }
            
            +++ Section("Selectors Rows Examples")
            
            <<< ActionSheetRow<String>() {
                $0.title = "ActionSheetRow"
                $0.selectorTitle = "Your favourite player?"
                $0.options = ["Diego Forlán", "Edinson Cavani", "Diego Lugano", "Luis Suarez"]
                $0.value = "Luis Suarez"
            }
            
            <<< AlertRow<Emoji>() {
                $0.title = "AlertRow"
                $0.selectorTitle = "Who is there?"
                $0.options = [💁🏻, 🍐, 👦🏼, 🐗, 🐼, 🐻]
                $0.value = 👦🏼
                }.onChange { row in
                    print(row.value)
                }
                .onPresent{ _, to in
                    to.view.tintColor = .purpleColor()
            }
            
            <<< PushRow<Emoji>() {
                $0.title = "PushRow"
                $0.options = [💁🏻, 🍐, 👦🏼, 🐗, 🐼, 🐻]
                $0.value = 👦🏼
                $0.selectorTitle = "Choose an Emoji!"
            }
//            
//            <<< LocationRow(){
//                $0.title = "LocationRow"
//                $0.value = CLLocation(latitude: -34.91, longitude: -56.1646)
//            }
            
            <<< ImageRow(){
                $0.title = "ImageRow"
            }
            
            <<< MultipleSelectorRow<Emoji>() {
                $0.title = "MultipleSelectorRow"
                $0.options = [💁🏻, 🍐, 👦🏼, 🐗, 🐼, 🐻]
                $0.value = [👦🏼, 🍐, 🐗]
                }
                .onPresent { from, to in
                    to.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: from, action: "multipleSelectorDone:")
            }
            
            +++ Section("Generic picker")
            
//            <<< PickerRow<String>("Picker Row") { (row : PickerRow<String>) -> Void in
//                
//                row.options = []
//                for i in 1...10{
//                    row.options.append("option \(i)")
//                }
//                
//            }
            
            +++ Section("FieldRow examples")
            
            <<< TextRow() {
                $0.title = "TextRow"
                $0.placeholder = "Placeholder"
            }
            
            <<< DecimalRow() {
                $0.title = "DecimalRow"
                $0.value = 5
            }
            
            <<< URLRow() {
                $0.title = "URLRow"
                $0.value = NSURL(string: "http://xmartlabs.com")
            }
            
            <<< PhoneRow() {
                $0.title = "PhoneRow (disabled)"
                $0.value = "+598 9898983510"
                $0.disabled = true
            }
            
            <<< NameRow() {
                $0.title =  "NameRow"
            }
            
            <<< PasswordRow() {
                $0.title = "PasswordRow"
                $0.value = "password"
            }
            
            <<< IntRow() {
                $0.title = "IntRow"
                $0.value = 2015
            }
            
            <<< EmailRow() {
                $0.title = "EmailRow"
                $0.value = "a@b.com"
            }
            
            <<< TwitterRow() {
                $0.title = "TwitterRow"
                $0.value = "@xmartlabs"
            }
            
            <<< AccountRow() {
                $0.title = "AccountRow"
                $0.placeholder = "Placeholder"
            }
            
//            <<< ZipCodeRow() {
//                $0.title = "ZipCodeRow"
//                $0.placeholder = "90210"
//        }
    }
    
    func multipleSelectorDone(item:UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }
    
}

