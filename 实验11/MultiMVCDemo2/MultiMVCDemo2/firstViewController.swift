//
//  ViewController.swift
//  MultiMVCDemo2
//
//  Created by student on 2018/11/29.
//  Copyright © 2018年 huxiaodng. All rights reserved.
//

import UIKit
//protocol StudentProtocol {
//    func change(name:String, no:String)
//}

class firstViewController: UIViewController {
//    func change(name: String, no: String) {
//        self.no = no
//        self.name = name
//    }
    var stu = Student()
//    var name = ""
//    var no = ""
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
//        tfNo.text = no
//        tfName.text = name
        tfNo.text = stu.no
        tfName.text = stu.name
    }
    @IBAction func showsecondVC(_ sender: Any) {
        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondVC") as!secondViewController
//        secVC.no = tfNo.text!
//        secVC.name = tfName.text!
        stu.no = tfNo.text!
        stu.name = tfName.text!
        secVC.stu = stu
        //secVC.delegate = self
        //present(secVC,animated: true, completion: nil)//呈现出来
        self.navigationController?.pushViewController(secVC, animated: true)//左上角添加返回按钮（系统自带），就必须用pop关闭，否则无法关闭
    }
    
    @IBAction func showthirdVC(_ sender: Any) {
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "thirdVC")
        present(thirdVC,animated: true, completion: nil)//呈现出来
        
    }
}

