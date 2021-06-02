//
//  Initializer.swift
//  Belo
//
//  Created by ispha on 10/6/19.
//  Copyright © 2019 ispha. All rights reserved.
//


import UIKit

class Initializer {
    class func getStoryBoard(storyboardID: String) -> UIStoryboard {
        let storyBoard = UIStoryboard(name: storyboardID, bundle: nil)
        return storyBoard
    }
    
    class func createViewControllerWithId(storyBoardId: String, viewcontrollerId: String) -> UIViewController {
        let storboard = getStoryBoard(storyboardID: storyBoardId)
        let vc = storboard.instantiateViewController(withIdentifier: viewcontrollerId)
        return vc
    }
    
    class func createNavigationWithId(storyBoardId: String, viewcontrollerId: String) -> UINavigationController {
        let storboard = getStoryBoard(storyboardID: storyBoardId)
        let vc = storboard.instantiateViewController(withIdentifier: viewcontrollerId)
        return vc as! UINavigationController
    }
    
    class func createWindow() -> UIWindow {
        let appDelegate = UIApplication.shared.delegate as! SceneDelegate
        let window = appDelegate.window
        return window!
    }
}
