//
//  MainTabBarController.swift
//  Zhe800
//
//  Created by Bing Ma on 9/2/15.
//  Copyright (c) 2015 Bing Ma. All rights reserved.
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
        
        addChildController("Home", "首页", "home_tab_home_btn", "home_tab_home_selected_btn")
        addViewController("Message", "分类", "home_tab_saunter_btn", "home_tab_saunter_selected_btn")
        addChildController("Message", "品牌团", "home_tab_branc_btn", "home_tab_branc_selected_btn")
        addChildController("Message", "积分商城", "home_tab_point_btn", "home_tab_point_selected_btn")
        addViewController("Me", "个人中心", "home_tab_personal_btn", "home_tab_personal_selected_btn")
        
    }
    
    // Add child Controller
    func addChildController(name: String, _ title: String, _ imageName: String, _ highlight: String) -> Void {
        
        let sb = UIStoryboard(name: name, bundle: nil)
        let vc = sb.instantiateInitialViewController() as! UINavigationController
        
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5.0, 0)
        vc.tabBarItem.selectedImage = UIImage(named: highlight)?.imageWithRenderingMode(.AlwaysOriginal)
        vc.tabBarItem.title = title
        vc.navigationItem.title = title
        
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(red: 198/255.0, green: 60/255.0, blue: 85/255.0, alpha:1)], forState: UIControlState.Selected)

        self.addChildViewController(vc)
    }
    
    // add ViewController
    func addViewController(name: String, _ title: String, _ imageName: String, _ highlight: String) -> Void {
        let sb = UIStoryboard(name: name, bundle: nil)
        let vc = sb.instantiateInitialViewController() as! UIViewController
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: highlight)?.imageWithRenderingMode(.AlwaysOriginal)
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5.0, 0)
        vc.tabBarItem.title = title
        
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(red: 198/255.0, green: 60/255.0, blue: 85/255.0, alpha:1)], forState: UIControlState.Selected)
        
        self.addChildViewController(vc)
    }

}
