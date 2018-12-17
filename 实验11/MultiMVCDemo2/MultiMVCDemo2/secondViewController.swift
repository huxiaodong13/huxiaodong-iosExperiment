//
//  secondViewController.swift
//  MultiMVCDemo2
//
//  Created by student on 2018/11/29.
//  Copyright © 2018年 huxiaodng. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

//    var name = ""
//    var no = ""
//    var delegate:  StudentProtocol?
    var stu:Student!
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//        tfNo.text = no
//        tfName.text = name
        tfNo.text = stu.no
        tfName.text = stu.name
        //self.view.backgroundColor = UIColor.purple
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {//关闭
        //dismiss(animated: true, completion: nil)
        stu.no = tfNo.text!
        stu.name = tfName.text!
//       delegate?.change(name: name, no: no)
//        for vc in self.navigationController!.viewControllers {//刷新VC1的界面
//        if let firstVC = vc as? firstViewController {
//            firstVC.no = no
//            firstVC.name = name
//        }
//        }
    navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
