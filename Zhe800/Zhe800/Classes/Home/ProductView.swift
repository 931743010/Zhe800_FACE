//
//  ProductView.swift
//  Zhe800
//
//  Created by Bing Ma on 9/4/15.
//  Copyright (c) 2015 Bing Ma. All rights reserved.
//

import UIKit

class ProductView: UIView {

    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var subLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func btnClick(sender: AnyObject) {
        
        var alt = UIAlertView(title: "测试数据", message: "|<---TEST: \(headerLbl.text!)--->|", delegate: self, cancelButtonTitle: "取消")
        
        alt.show()

    }
    
    
    /// xib加载自定义视图
    class func productViewWithNib() -> AnyObject {

        var bundle = NSBundle.mainBundle()
        var objs: NSArray = bundle.loadNibNamed("ProductView", owner: nil, options: nil)
        
        return objs.lastObject!
    }
}
