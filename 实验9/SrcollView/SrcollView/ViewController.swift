//
//  ViewController.swift
//  SrcollView
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{


    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var srcollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...9 {//是每张图片都展示出来
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode =  .scaleAspectFit//每张图片的所有
            srcollView.isPagingEnabled = true //每滑动一次只能显示一张
            imageView.frame = CGRect(x: CGFloat(i-1) * srcollView.bounds.width, y: 0, width: srcollView.bounds.width, height: srcollView.bounds.height)
            srcollView.addSubview(imageView)
        }
        srcollView.contentSize = CGSize(width: 9 * srcollView.bounds.width, height: srcollView.bounds.height)//每张图片衔接，如何展示
        pageControl.numberOfPages = 9 //一共多少t页
        pageControl.currentPage = 0
        srcollView.isUserInteractionEnabled = true
        srcollView.showsHorizontalScrollIndicator = false
//        let imageView = UIImageView(image: UIImage(named: "1"))
//        srcollView.addSubview(imageView)
//        srcollView.contentSize = imageView.bounds.size //图片可以拖拽
//        srcollView.minimumZoomScale = 0.2//图片可以放大和缩小的程度
//        srcollView.maximumZoomScale = 5
        srcollView.delegate = self
    }
    
    func scrollViewDidEndDecelerating(_ srcollView: UIScrollView) {//小点跟随图片移动
    let currentPage = srcollView.contentOffset.x/srcollView.bounds.width
    pageControl.currentPage = Int(currentPage)
    }
    
    @IBAction func pageControlClikced(_ sender: UIPageControl) {//点击自主显示想看的图片
//        let currentPage = sender.currentPage
//        let rect = CGRect(x: CGFloat(currentPage) * srcollView.bounds.width, y: 0, width: srcollView.bounds.width, height: srcollView.bounds.height)
        let rect = CGRect(x: CGFloat(pageControl.currentPage) * srcollView.bounds.width, y: 0, width: srcollView.bounds.width, height: srcollView.bounds.height)
        srcollView.scrollRectToVisible(rect, animated: true)
    }
    //    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        return scrollView.subviews.first
//    }
}

