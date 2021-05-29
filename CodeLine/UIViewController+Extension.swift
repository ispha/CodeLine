//
//  UIViewController+Extension.swift
//  Belo
//
//  Created by Muhammad Khan on 03/12/2020.
//  Copyright © 2020 belo. All rights reserved.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func showVC(_ vc: UIViewController, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            if let nav = self.navigationController {
                nav.pushViewController(vc, animated: true)
            } else {
                self.present(vc, animated: true, completion: completion)
            }
        }
    }
    
    func showWithSender(_ vc: UIViewController, sender: UIViewController) {
        DispatchQueue.main.async {
            self.show(vc, sender: sender)
        }
    }
    
    func presentVC(_ vc: UIViewController, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: completion)
        }
    }
    
    func moveBack() {
        DispatchQueue.main.async {
            if let nav = self.navigationController {
                if nav.viewControllers.count == 1 {
                    nav.dismiss(animated: true)
                } else {
                    nav.popViewController(animated: true)
                }
            } else {
                self.dismiss(animated: true)
            }
        }
    }
}
