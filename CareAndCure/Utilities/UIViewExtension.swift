//
//  UIView.swift
//  iTunesAssignment
//
//  Created by Mohamed anwar on 3/13/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit
import MBProgressHUD

protocol NibLoadable {
    
}
extension UIView {
    
    func showActivityIndicator(isUserInteractionEnabled: Bool) {
        DispatchQueue.main.async {
            let hud = MBProgressHUD.showAdded(to: self, animated: true)
            hud.isUserInteractionEnabled = !isUserInteractionEnabled
            hud.restorationIdentifier = "activityIndicator"
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            for subview in self.subviews where subview.restorationIdentifier == "activityIndicator" {
                guard let hud = subview as? MBProgressHUD else { return }
                hud.hide(animated: true)
            }
        }
    }
    
    static func loadFromNib(with owner: Any? = nil) -> Self {
        
        let nib = UINib(nibName: "\(self)", bundle: nil)
        guard let view = nib.instantiate(withOwner: owner, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }
        return view
    }
}
