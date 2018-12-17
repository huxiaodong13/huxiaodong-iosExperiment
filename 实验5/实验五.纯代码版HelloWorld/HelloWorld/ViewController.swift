//
//  ViewController.swift
//  HelloWorld
//
//  Created by student on 2018/10/17.
//  Copyright © 2018年 Huxiaodong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.yellow//背景颜色
        
        let label = UILabel(frame: CGRect(x: 200, y: 200, width: 200, height: 100))
        label.text = "Hello IOS"//标签内容
        label.backgroundColor = UIColor.blue//标签颜色
        label.textAlignment = .center //内容居中
        label.center  = view.center
        view.addSubview(label)//view中添加label
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 20))//按钮布置
        button.setTitle("Click Me", for: .normal)//给按钮赋一个标题
        button.setTitle("I am focused", for: .highlighted)
        button.setTitleColor(UIColor.red, for: .normal)
        view.addSubview(button)//view中添加button
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)

        
        
    }
    
    @IBAction func btnClicked() {
        if let label = view.subviews.first as? UILabel {
            label.text = "I am Clicked!"
        }
    }

}

