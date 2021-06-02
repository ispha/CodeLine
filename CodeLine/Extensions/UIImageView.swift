//
//  UIImageView.swift
//  Belo
//
//  Created by Muhammad Khan on 07/12/2020.
//  Copyright © 2020 belo. All rights reserved.
//

import UIKit

extension UIImageView {
    var imageUrl: String {
        get {
            return ""
        } set {
            let url = URL(string: newValue)
           // self.kf.setImage(with: url, placeholder: UIImage())
        }
    }
}
