//
//  SingletoneClass.swift
//  Belo
//
//  Created by ispha on 10/20/19.
//  Copyright © 2019 ispha. All rights reserved.
//

import UIKit

class SingletoneClass: NSObject {
    static let sharedInstance = SingletoneClass()
    var tabbarView : UIView?
    var tabBarInnerView : DesignableUIView?
    var tabbarConstraintBotm : NSLayoutConstraint?
    var currentIndex = 1
    var qrImg : UIImage?
    var lblhome = UILabel()
    var lblprofile = UILabel()
    var currentLat = "0.0"
    var currentLong = "0.0"
    var dataLoadded = false
    var brnachNAme = "---"
  
    var brandBrnachNameLbl = UILabel()
   
    var tabBar = UITabBar()
    var pagerViewController = UIPageViewController()
    var access_token = ""
  
    var lang = "en"
    var PriceSettingsAndTaxs = false
}
