//
//  MainNavViewController.swift
//  ChatBei
//
//  Created by Bing Ma on 5/25/15.
//  Copyright (c) 2015 iChatBei. All rights reserved.
//

import UIKit

// Test -- initialize -->The first invoke
// MARK: Setting The "UIBarButtonItem" appearance.
class MainNavViewController: UINavigationController {

    override class func initialize() {
        println(__FUNCTION__)
    }
    
    func setButtonItemApp() {
        // Setting the "Button" appearance
        let item = UIBarButtonItem.appearance()
        
        // Setting UIButton's color
        item.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blueColor()], forState: UIControlState.Normal)
    }
}
