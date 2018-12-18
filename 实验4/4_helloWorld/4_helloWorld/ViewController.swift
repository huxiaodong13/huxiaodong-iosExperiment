//
//  ViewController.swift
//  4_helloWorld
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!  //给一个label
    var btn: UIButton!//给一个按钮
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 44))//h规定大小
        label.text = "hello Swift"//文本
        label.font = UIFont.systemFont(ofSize: 22)//字体大小
        label.textColor = UIColor.black //颜色
        self.view.addSubview(label)//加入view中
        
        btn = UIButton(frame: CGRect(x: 100, y: 400, width: 50, height: 37))
        btn.setTitle("Click", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        btn.setTitleColor(UIColor.black, for: .highlighted)
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(cilcked), for: .touchUpInside)
    }
    
    @IBAction func cilcked() {
        if label.text! == "Clicked" {
            label.text = "hello Swift"
            btn.setTitle("Click", for: .normal)
        } else {
            label.text = "Clicked"
            btn.setTitle("hello", for: .normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
