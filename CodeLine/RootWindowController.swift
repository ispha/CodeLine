//
//  RootWindowController.swift
//  Belo
//
//  Created by ispha on 10/6/19.
//  Copyright © 2019 ispha. All rights reserved.
//

import UIKit

class RootWindowController: NSObject {
    class func setRootWindowForLogin() {
        let login = Initializer.createViewControllerWithId(storyBoardId: Constants.StoryBoardIDs.Account,
                                                       viewcontrollerId: Constants.StoryBoardVCIDs.PhoneViewController)
        let window = Initializer.createWindow()
        window.rootViewController = login
        window.makeKeyAndVisible()
    }
    
    class func setRootWindowForStart() {
        let StartVC = Initializer.createViewControllerWithId(storyBoardId: Constants.StoryBoardIDs.Main, viewcontrollerId: Constants.StoryBoardVCIDs.StartVC)
        let window = Initializer.createWindow()
        window.rootViewController = StartVC
        window.makeKeyAndVisible()
    }
    
    class func setRootWindowForTables() {
        let StartVC = Initializer.createViewControllerWithId(storyBoardId: Constants.StoryBoardIDs.Tables,
                                                             viewcontrollerId: Constants.StoryBoardVCIDs.TablesViewController)
        let window = Initializer.createWindow()
        window.rootViewController = StartVC
        window.makeKeyAndVisible()
    }
    
    class func setRootWindowForHome(selectedTab: Int) {
        let homeTab = Initializer.createViewControllerWithId(storyBoardId: Constants.StoryBoardIDs.Tab,
                                                             viewcontrollerId: Constants.StoryBoardVCIDs.tabHome)
          let window = Initializer.createWindow()
          window.backgroundColor = UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
          window.rootViewController = homeTab
          window.makeKeyAndVisible()
      }
}
