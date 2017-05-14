//
//  Setting.swift
//  Youtube
//
//  Created by Christopher Paterson on 14/05/2017.
//  Copyright © 2017 Christopher Paterson. All rights reserved.
//

import UIKit

class Setting: NSObject {
    let name: String
    let iconName: String
    
    init(name: String, iconName: String) {
        self.name = name
        self.iconName = iconName
    }
}
