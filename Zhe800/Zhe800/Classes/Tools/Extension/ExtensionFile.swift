//
//  ExtensionFile.swift
//  Zhe800
//
//  Created by Bing Ma on 9/2/15.
//  Copyright (c) 2015 Bing Ma. All rights reserved.
//

import UIKit

// 拓展
extension UIColor {
    
    //主题色
    class func applicationMainColor() -> UIColor {
        return UIColor.whiteColor()
    }
    
    //第二主题色
    class func applicationSecondColor() -> UIColor {
        return UIColor(red: 220/255.0, green: 33/255.0, blue: 68/255.0, alpha:1)    }
    
    //警告颜色
    class func applicationWarningColor() -> UIColor {
        return UIColor(red: 0.1, green: 1, blue: 0, alpha: 1)
    }
    
    //链接颜色
    class func applicationLinkColor() -> UIColor {
        return UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha:1)
    }
    
}


// MARK: - Navagation拓展
extension UIViewController {
    
    func viewDidLoadForChangeTitleColor() {
        self.viewDidLoadForChangeTitleColor()
        if self.isKindOfClass(UINavigationController.classForCoder()) {
            self.changeNavigationBarTextColor(self as! UINavigationController)
        }
    }
    
    func changeNavigationBarTextColor(navController: UINavigationController) {
        let nav = navController as UINavigationController
        let dic = NSDictionary(object: UIColor.applicationMainColor(),
            forKey:NSForegroundColorAttributeName)
        nav.navigationBar.titleTextAttributes = dic as [NSObject : AnyObject]
        nav.navigationBar.barTintColor = UIColor.applicationSecondColor()
        nav.navigationBar.tintColor = UIColor.applicationMainColor()
       
    }
    
}

// button
extension UIButton {
    
    //按钮可以样式
    func setButtonCanUse(button : UIButton){
        button.userInteractionEnabled = true
        button.backgroundColor = UIColor(red: 0/255, green: 155/255, blue: 255/255, alpha:1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 3
    }
    
    //按钮不可用样式
    func setButtonCannntUse(button: UIButton){
        button.userInteractionEnabled = false
        button.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        button.layer.masksToBounds = true
        button.layer.cornerRadius  = 3
    }

}

// UIView
extension UIView {
    
    func setViewCornerRadius(view:UIView ,radius:CGFloat){
        view.layer.cornerRadius = radius
        view.layer.masksToBounds = true
    }
    
}

