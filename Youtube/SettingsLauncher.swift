//
//  SettingsLauncher.swift
//  Youtube
//
//  Created by Christopher Paterson on 14/05/2017.
//  Copyright © 2017 Christopher Paterson. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject {
    override init() {
        super.init()
    }
    
    let blackView = UIView()
    
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
            
            let height: CGFloat = 200
            let y = window.frame.height - 200 // Pin to bottom
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
    
    func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height,
                    width: self.collectionView.frame.width,
                    height: self.collectionView.frame.height)
            }
        }
    }
}
