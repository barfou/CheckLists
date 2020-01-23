//
//  CheckListItem.swift
//  CheckLists
//
//  Created by lpiem on 23/01/2020.
//  Copyright © 2020 lpiem. All rights reserved.
//

import Foundation

class CheckListItem {
    var text: String
    var checked: Bool
    
    init(_ text: String) {
        self.text = text
        self.checked = false
    }
    
    init(_ text: String, _ checked: Bool) {
        self.text = text
        self.checked = checked
    }
    
    func toggleChecked() {
        self.checked =  !self.checked
    }
 }
