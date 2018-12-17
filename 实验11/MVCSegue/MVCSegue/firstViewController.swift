//
//  ViewController.swift
//  MVCSegue
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import UIKit

class firstViewController: UIViewController {
    //var stu = Student()

    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
//    override func viewWillAppear(_ animated: Bool) {
//                tfNo.text = stu.no
//                tfName.text = stu.name
//
//    }
    
    //预先判断这是哪一个界面
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Second" {
//            stu.no = tfNo.text!
//            stu.name = tfName.text! //!表强转
            let secVC = segue.destination as! secondViewController
            secVC.name = tfName.text! //正向传参
            secVC.no = tfNo.text!
        }
    }
    
    @IBAction func changeName(segue:UIStoryboardSegue) {//当第二界面退出时调用，并将他的文本传过来
        let secVC = segue.source as! secondViewController
        tfName.text = secVC.name
        tfNo.text = secVC.no
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

