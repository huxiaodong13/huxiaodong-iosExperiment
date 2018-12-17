//
//  ViewController.swift
//  Gestures_9
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func add(_ sender: Any) {
        //随机产生方块
        let x = Int(arc4random()) % Int(self.view.bounds.width)
        let y = Int(arc4random()) % Int(self.view.bounds.height)
        
        let label = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 30))
        label.text = "A"
        label.textAlignment = .center
        label.backgroundColor = UIColor.red
        
        //添加阴影
                label.layer.shadowColor = UIColor.gray.cgColor
                label.layer.shadowOffset = CGSize(width: 10, height: 10)
                label.layer.shadowOpacity = 1
        self.view.addSubview(label)
        
        
             
    }
    
    @IBAction func move(_ sender: Any) {
        for label in self.view.subviews {
            if label is UILabel {
                UIView.animate(withDuration: 1) {
                    let x = Int(arc4random()) % Int(self.view.bounds.width)
                    let y = Int(arc4random()) % Int(self.view.bounds.height)
                    //label.center = CGPoint(x: x, y: y)
                    label.center.x = CGFloat(x)
                    label.center.x = CGFloat(y)
                }
            }
        }
    }
    @IBAction func del(_ sender: Any) {
        for label in self.view.subviews {
            if label is UILabel {
                label.removeFromSuperview()
            }
        }
    }
}

