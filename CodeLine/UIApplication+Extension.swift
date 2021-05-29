//
//  UIApplication+Extension.swift
//  Belo
//
//  Created by Muhammad Khan on 03/12/2020.
//  Copyright © 2020 belo. All rights reserved.
//

import UIKit
//import MBProgressHUD

extension UIApplication {
    class func showLoader(_ animated: Bool = true) {
        guard let window = UIApplication.shared.windows.first else { return }
        //MBProgressHUD.showAdded(to: window, animated: animated)
    }
    
    class func hideLoader(_ animated: Bool = true) {
        guard let window = UIApplication.shared.windows.first else { return }
        //MBProgressHUD.hide(for: window, animated: true)
    }
}
