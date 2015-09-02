//
//  AppDelegate.swift
//  Zhe800
//
//  Created by Bing Ma on 9/2/15.
//  Copyright (c) 2015 Bing Ma. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Navgation's style --> color.[ExtensionFile.swift]
        swizzlingMethod(UIViewController.self, oldSelector: "viewDidLoad", newSelector: "viewDidLoadForChangeTitleColor")
        
        return true
    }
    
    //Hook工具类--runtime
    func swizzlingMethod(clzz: AnyClass, oldSelector: Selector, newSelector: Selector) {
        let oldMethod = class_getInstanceMethod(clzz, oldSelector)
        let newMethod = class_getInstanceMethod(clzz, newSelector)
        method_exchangeImplementations(oldMethod, newMethod)
    }

}

