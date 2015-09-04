//
//  HomeViewController.swift
//  Zhe800
//
//  Created by Bing Ma on 9/2/15.
//  Copyright (c) 2015 Bing Ma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIAlertViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var btnViews: UIView!
    var timer : NSTimer?
    let imgCount = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addRecyclePictureView()
        
        // BUG: 
        // 1、为什么老是在第1页卡shi？--自动 ->done
        // 2、滑动没有循环--手动滑时？滑动到最后一页时，应该自动加载第一页！！->todo
        
        self.addButtons()
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// TODO: 2、“九宫格”方式动态加载btn，实现其功能（本应该：自定义xib+读取plist文件+建模型数据&封装方法进行赋值！）2 x 4 = 8个view，现在直接加了8个btn并实现其测试的点击事件
    func addButtons() {
        let btnW = self.btnViews.bounds.width / 4
        let btnH = self.btnViews.bounds.height / 2
        let columns = 4;
        
        for var i = 0; i < 8; i++ {
            
            // 计算当前的格子所在的列的索引
            var col = CGFloat(i % columns);
            // 计算每个格子所在的行的索引
            var row = CGFloat(i / columns);
            
            var btn = UIButton()
            
            // appX = marginX + 当前app所在的列的索引 * (appW + marginX)
            var btnX = col * btnW;
            // appY = marginTop + row * (appH + marginY)
            var btnY = row * btnH
            
            btn.frame = CGRectMake(btnX, btnY, btnW, btnH)
//            btn.backgroundColor = UIColor.redColor()
            btn.tag = i
            btn.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
            self.btnViews.addSubview(btn)
        }
    }
    
    func btnClick(sender: UIButton) {
        println("the \(sender.tag)")
        
        var alt = UIAlertView(title: "测试数据", message: "点击了第【\(sender.tag+1)】个button！", delegate: self, cancelButtonTitle: "取消")
        
        alt.show()
    }
    
    /// TODO: 1、图片轮播器
    func addRecyclePictureView() {
        
        let imgW = UIScreen.mainScreen().bounds.width
        println(imgW)
        let imgH = 122 as CGFloat
        let imgY = 0 as CGFloat
        
        for var i = 0; i < imgCount; i++ {
            var imgView = UIImageView() as UIImageView
            var imgName = NSString(format: "img_0%d", i+1)
            imgView.image = UIImage(named: imgName as String)
            
            // setting frame
            var imgX = CGFloat(i) * imgW
            imgView.frame = CGRectMake(imgX, imgY, imgW, imgH)
            
            self.scrollView.addSubview(imgView)
        }
        
        // setting
        self.scrollView.contentSize = CGSizeMake(CGFloat(imgCount) * imgW, 0)
        self.scrollView.pagingEnabled = true
        self.scrollView.showsHorizontalScrollIndicator = false
        
        
        // auto play the pictures.
        self.timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "autoNextImage", userInfo: nil, repeats: true)
        
        /// FIXME: BUG->解决拖动其他控件的时候, 图片轮播期不动了
        // [todo -> 将self.timer加到当前线程的消息循环中 ]
        var runLoop = NSRunLoop.currentRunLoop()
        runLoop.addTimer(self.timer!, forMode: NSRunLoopCommonModes)
    }
    
    /// 1.1 自动滚到下一页
    func autoNextImage() {
        
        var page = self.pageControl.currentPage as Int
        if(page == self.pageControl.numberOfPages - 1){
            page = 0;
        } else {
            page++;
        }

        let offsetX = CGFloat(page) * self.scrollView.frame.size.width
        self.scrollView.setContentOffset(CGPointMake(offsetX, 0), animated: true)
    }
}

// MARK: TableView Delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("idHomeCell") as! UITableViewCell
        
//        cell.textLabel?.text = "Test、\(indexPath.row)"
        
        return cell
    }
    
    
}

// MARK: UIScrollView Delegate
extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let point = scrollView.contentOffset
        let scrollW = scrollView.frame.size.width
        
        // Calculating the current page. 
        var page = (point.x + (scrollW * 0.5)) / scrollW// [当滚动多半个界面时，pageControl定位到下一页。]
//        self.pageControl.currentPage = Int(page) != imgCount ? Int(page) : 0
        self.pageControl.currentPage = Int(page)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "autoNextImage", userInfo: nil, repeats: true)
    }
}
