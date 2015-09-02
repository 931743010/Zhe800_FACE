//
//  MainTabBar.swift
//  ChatBei
//
//  Created by Bing Ma on 5/25/15.
//  Copyright (c) 2015 iChatBei. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
         setButtonsFrame()
    }
    
    
    let buttonCount = 4
    
    func setButtonsFrame() {
        
        let width = self.bounds.size.width / CGFloat(buttonCount)
        let height = self.bounds.size.height

        var index = 0
        
        // MARK: UITabBarButton --> 私有API
        for view in self.subviews as! [UIView] {
            
            // 判断子视图是否是控件
            // MARK: [- tip -] UITabBarButton 继承与 UIControl
            if (view is UIControl) && !(view is UIButton) {
                let rect = CGRectMake(CGFloat(index) * width, 0, width, height)
                
                view.frame = rect
                
                index++
            }
        }
    }
}

