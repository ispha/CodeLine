//
//  UIScrollView+Extension.swift
//  Belo
//
//  Created by Muhammad Khan on 03/12/2020.
//  Copyright © 2020 belo. All rights reserved.
//

import UIKit

extension UIScrollView {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        next?.touchesBegan(touches, with: event)
    }
}
