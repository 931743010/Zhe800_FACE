//
//  MainTabBarController.swift
//  ChatBei
//
//  Created by Bing Ma on 5/25/15.
//  Copyright (c) 2015 iChatBei. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    

//    @IBOutlet weak var mainTabBar: MainTabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addControllers()
        
        
        // tabBar半透明效果
        /*
        self.tabBarController?.tabBar.backgroundColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 0.3)
        var bgImg = UIImage()
        self.tabBarController?.tabBar.backgroundImage = bgImg
        if UIDevice.currentDevice().systemVersion == "8.0"{
            UITabBar.appearance().selectedImageTintColor = UIColor(red: 172.0/255.0, green: 186.0/255.0, blue: 235.0/255.0, alpha: 0.2)
            UITabBar.appearance().selectionIndicatorImage = bgImg
         */
    }
    
    func addControllers() {
        
        addchildController("Home", "首页", "tabbar_home", "tabbar_home_highlighted")
        addchildController("Message", "消息", "tabbar_message", "tabbar_message_highlighted")
        addchildController("Me", "我", "tabbar_me", "tabbar_me_highlighted")
        
    }
    
    // Add child Controller
    func addchildController(name: String, _ title: String, _ imageName: String, _ highlight: String) {
        
        let sb = UIStoryboard(name: name, bundle: nil)
        let vc = sb.instantiateInitialViewController() as! UINavigationController
        
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: highlight)?.imageWithRenderingMode(.AlwaysOriginal)
        
        vc.title = title
        
        vc.navigationItem.title = title
        
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(red: 0/255.0, green: 130/255.0, blue: 255/255.0, alpha: 1)], forState: UIControlState.Selected)
        
        self.addChildViewController(vc)
    }
}
