//
//  detailViewController.swift
//  coreDate13
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 2016110313. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    var person:Person?
    @IBOutlet weak var tfname: UILabel!
    @IBOutlet weak var tfphone: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        tfphone.text = person?.phone
        tfname.text = person?.name
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
