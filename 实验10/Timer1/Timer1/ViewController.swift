//
//  ViewController.swift
//  Timer1
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: {(mytimer) in
            self.myView.center.x += 10 //x的变化
            self.myView.frame = CGRect(x: self.myView.center.x, y: 40, width: 60, height: 60)//移动并且改变视图大小
        })
    }

    @IBAction func btnClick(_ sender: Any) {//添加按钮
        timer?.invalidate()//令视图停止移动
//
////屏幕可以旋转 当options: .curveEaseInOut出去就不再回来了
        UIView.animate(withDuration: 2, delay: 1, options: [.curveEaseInOut,.autoreverse,.repeat], animations: {
            self.myView.backgroundColor = UIColor.green//改变视图颜色
            self.myView.center.x = self.view.bounds.width
            self.myView.alpha = 1 //当为0时，表示视图变透明消失，层次不在，为1时直接消失，但层次是在的
            self.myView.transform = CGAffineTransform(rotationAngle:
                CGFloat(Double.pi)).scaledBy(x: 0.5, y: 0.5)
            self.myView.transform = CGAffineTransform.identity//恢复视图原来的样子

            self.myView.transform = CGAffineTransform(rotationAngle:
                CGFloat(Double.pi))
            self.myView.transform = CGAffineTransform.identity//恢复视图原来的样子
            self.myView.transform = CGAffineTransform(rotationAngle:
                CGFloat(Double.pi))
            self.myView.transform = CGAffineTransform.identity//恢复视图原来的样子
            }) { (finished) in
            self.myView.removeFromSuperview()
        }
        
        //b)    切换两个子视图，观察切换后视图层次的变化情况
        UIView.transition(with: myView, duration: 2, options: .transitionCurlUp, animations:{ self.myView.backgroundColor = UIColor.green}, completion: nil)
    }
    
}

