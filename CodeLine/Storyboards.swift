//
//  Storyboards.swift
//  Belo
//
//  Created by Muhammad Khan on 03/12/2020.
//  Copyright © 2020 belo. All rights reserved.
//

import UIKit

extension UIStoryboard {
    enum StoryboardName: String {
        case branches = "Branches"
        case notifications = "Notificaitons"
        case profiles = "Profile"
        case account = "Account"
        case receipt = "Receipt"
        case addCard = "AddCard"
        case tables = "Tables"
        case main = "Main"
        case home = "Home"
        case cart = "Cart"
        case tab = "Tab"
    }
    
    convenience init(stroyBoard: StoryboardName, bundle: Bundle? = nil) {
        self.init(name: stroyBoard.rawValue, bundle: bundle)
    }
    
    func instantiateVC<VC: UIViewController>() -> VC {
        guard let viewController = instantiateViewController(withIdentifier: VC.identifier) as? VC else {
            fatalError("Couldn't instantiate viewController with identifier \(VC.identifier)")
        }
        return viewController
    }
}
