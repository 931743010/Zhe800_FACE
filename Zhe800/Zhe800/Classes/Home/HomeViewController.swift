//
//  HomeViewController.swift
//  Zhe800
//
//  Created by Bing Ma on 9/2/15.
//  Copyright (c) 2015 Bing Ma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var timer : NSTimer?
    let imgCount = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addRecyclePictureView()
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "autoNextImage", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// TODO: 1、图片轮播器
    func addRecyclePictureView() {
        
        let imgW = UIScreen.mainScreen().bounds.width
        println(imgW)
        let imgH = 122 as CGFloat
        let imgY = 0 as CGFloat
        
        for var i = 0; i < imgCount; i++ {
            var imgView = UIImageView() as UIImageView
            var imgName = NSString(format: "img_%d", i)
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
        
        return 44
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("idHomeCell") as! UITableViewCell
        
        cell.textLabel?.text = "Test、\(indexPath.row)"
        
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
}
