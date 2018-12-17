//
//  ViewController.swift
//  NetView
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loadWithUrl(_ sender: Any) {//点击就会在网上下载一个图片
        //拿到数据 ，读文件访问网络 都一定要try,可能会发生锁住，所以..
        DispatchQueue.global().async{
            if let url = URL(string: "http://10.0.1.2/pic.php?id=1"){
              if  let data = try? Data(contentsOf: url){
                DispatchQueue.main.async{
                        self.imageView1.image = UIImage(data: data)
                }
            }
        }
        }
    }
    
    @IBAction func loadWithSession(_ sender: Any) {
        if let url = URL(string: "http://10.0.1.2/pic.php?id=2") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    DispatchQueue.main.async {
                        self.imageView2.image = UIImage(data: data!)
                    }
                }
            }
            task.resume()
        }
        
    }
    @IBAction func loadWithAlamofire(_ sender: Any) {
        
    }
}

