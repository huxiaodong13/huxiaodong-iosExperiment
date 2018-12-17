//
//  ViewController.swift
//  MultiThreadDemo
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var jishu: UILabel! //计数表现
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count += 1
            self.jishu.text = "\(self.count)"
            //           print("timer thread:\(Thread.current)")//打印线程号
            }.fire()
    }
    //UIView必须要放进主线程执行
//为了防止进程太大而锁住，那么
    @IBAction func sum(_ sender: Any) {
        var sum = 0
        DispatchQueue.global().async{
            print("Run thread:\(Thread.current)")//打印当前线程
            for i in 1...9999999 {
                sum +=  i
            }
        }
        DispatchQueue.main.async {//拿到主队列
            self.total.text  = "\(sum)" //用String表示
        }
       
        
    }
    
}

