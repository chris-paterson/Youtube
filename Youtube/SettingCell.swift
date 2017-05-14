//
//  SettingCell.swift
//  Youtube
//
//  Created by Christopher Paterson on 14/05/2017.
//  Copyright © 2017 Christopher Paterson. All rights reserved.
//

import UIKit

class SettingCell: BaseCell {
    
    var setting: Setting? {
        didSet {
            nameLabel.text = setting?.name
            
            if let imageName = setting?.iconName {
                icon.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
                icon.tintColor = .darkGray
            }
            
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            self.backgroundColor = isHighlighted
                ? .darkGray
                : .white
            
            nameLabel.textColor = isHighlighted
                ? .white
                : .black
            
            icon.tintColor = isHighlighted
                ? .white
                : .darkGray
        }
    }
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
        
    }()
    
    let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic-settings")
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(nameLabel)
        addSubview(icon)
        
        addConstraintsWithFormat(format: "H:|-8-[v0(30)]-8-[v1]|", views: icon, nameLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: nameLabel)
        addConstraintsWithFormat(format: "V:[v0(30)]", views: icon)
        addConstraint(NSLayoutConstraint(item: icon, attribute: .centerY,
            relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
