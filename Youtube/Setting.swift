//
//  Setting.swift
//  Youtube
//
//  Created by Christopher Paterson on 14/05/2017.
//  Copyright © 2017 Christopher Paterson. All rights reserved.
//

import UIKit

enum SettingName: String {
    case cancel = "Cancel"
    case setting = "Settings"
    case termsAndPrivacyPolicy = "Terms & Privacy Policy"
    case sendFeedback = "Send Feedback"
    case help = "Help"
    case switchAccount = "Switch Account"
}

class Setting: NSObject {
    let name: SettingName
    let iconName: String
    
    init(name: SettingName, iconName: String) {
        self.name = name
        self.iconName = iconName
    }
}
