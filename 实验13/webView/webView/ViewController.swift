//
//  ViewController.swift
//  webView
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "http://www.163.com"){//希望它打开一个网址
            webView.load(URLRequest(url: url))
        }
    }
//实现交互
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func forward(_ sender: Any) {
        webView.goForward()
    }
    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
    @IBAction func go(_ sender: Any) {
        if let url = URL(string: tfUrl.text!){//希望它打开一个网址
            webView.load(URLRequest(url: url))
        }
    }
}

