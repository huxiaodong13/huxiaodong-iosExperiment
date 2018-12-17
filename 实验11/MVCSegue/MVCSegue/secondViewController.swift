//
//  secondViewController.swift
//  MVCSegue
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    //var stu:Student!
    var name = ""
    var no = ""
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

//        tfNo.text = stu.no
//        tfName.text = stu.name
        tfNo.text = no
        tfName.text = name
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func backButton(_ sender: UIButton) {
////        stu.no = tfNo.text!
////        stu.name = tfName.text!
//            no = tfNo.text!
//            name = tfName.text!
//        navigationController?.popViewController(animated: true)
//
//    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        no = tfNo.text!
        name = tfName.text!
    }
    

}
