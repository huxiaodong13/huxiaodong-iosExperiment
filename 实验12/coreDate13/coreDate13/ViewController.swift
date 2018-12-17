//
//  ViewController.swift
//  coreDate13
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 2016110313. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tfname: UITextField!
    @IBOutlet weak var tfphone: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate //拿到自己的代理
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //print(NSHomeDirectory())//打印存入的目录，用于测试
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)//关闭窗口
    }
    @IBAction func add(_ sender: Any) {
        let person = Person(context: context) //给他上下文
        person.name = tfname.text
        person.phone = tfphone.text
        dismiss(animated: true, completion: nil)//关闭窗口
        
    }
    @IBAction func update(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()//返回一个请求
        fetch.predicate = NSPredicate(format: "name=%@", tfname.text!)
        let persons = try? context.fetch(fetch)  //try用于抛异常
        if let p = persons?.first { //如果查询到，就d返回给他
            p.phone = tfphone.text //更新
            
        }
        
    }
    
    @IBAction func del(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()//返回一个请求
        fetch.predicate = NSPredicate(format: "name=%@", tfname.text!)
        let persons = try? context.fetch(fetch)  //try用于抛异常
        if let p = persons?.first { //如果查询到，就d返回给他
            context.delete(p)
            
        }
    }
    
    @IBAction func query(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()//返回一个请求
        fetch.predicate = NSPredicate(format: "name=%@", tfname.text!)
        let persons = try? context.fetch(fetch)  //try用于抛异常
        if let p = persons?.first { //如果查询到，就d返回给他
            tfphone.text = p.phone
        }
    }
}
    

        


