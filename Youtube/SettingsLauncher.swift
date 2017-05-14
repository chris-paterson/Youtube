//
//  SettingsLauncher.swift
//  Youtube
//
//  Created by Christopher Paterson on 14/05/2017.
//  Copyright © 2017 Christopher Paterson. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject {
    let cellId = "cellId"
    let cellHeight: CGFloat = 50
    
    let blackView = UIView()
    
    let settings: [Setting] = {
        return [
            Setting(name: "Settings", iconName: "ic-settings"),
            Setting(name: "Terms & Privacy Policy", iconName: "ic-lock"),
            Setting(name: "Send Feedback", iconName: "ic-feedback"),
            Setting(name: "Help", iconName: "ic-help"),
            Setting(name: "Switch Account", iconName: "ic-account-circle-black"),
            Setting(name: "Cancel", iconName: "ic-cancel")
        ]
    }()
    
    var homeController: HomeController?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    func showSettings() {
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            window.addSubview(collectionView) // Make sure we add after blackView
            
            let height: CGFloat = CGFloat(settings.count) * cellHeight
            let y = window.frame.height - height // Pin to bottom
            collectionView.frame = CGRect(x: 0, y: window.frame.height,
                                          width: window.frame.width, height: height)
            
            blackView.frame = window.frame
            blackView.alpha = 0 // Used for animation below.
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1,
                initialSpringVelocity: 1, options: .curveEaseOut,
                animations: {
                    self.blackView.alpha = 1

                    self.collectionView.frame = CGRect(x: 0, y: y,
                        width: self.collectionView.frame.width,
                        height: self.collectionView.frame.height)
                    
            }, completion: nil)
        }
    }
    
    func handleDismiss(setting: Setting) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut,
            animations: {
                self.blackView.alpha = 0
            
                if let window = UIApplication.shared.keyWindow {
                    self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
                }
        }) { completed in
            if setting.name != "" && setting.name != "Cancel" {
                self.homeController?.showControllerForSetting(setting: setting)
            }
        }
    }
    
    override init() {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(SettingCell.self, forCellWithReuseIdentifier: cellId)
    }
}

extension SettingsLauncher: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SettingCell
        
        cell.setting = settings[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        handleDismiss(setting: settings[indexPath.item])
        
    }
}

extension SettingsLauncher: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


















