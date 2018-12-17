//
//  ViewController.swift
//  TextFieldAndTableView
//
//  Created by student on 2018/11/8.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ChooseLable: UILabel!
    var stuArray = [Student]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: StudentTableViewCell!
        //        if indexPath.row % 2 == 0 {
        //            cell = tableView.dequeueReusableCell(withIdentifier: "StuCell")
        //        } else {
        //            cell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell")
        //        }
        cell = (tableView.dequeueReusableCell(withIdentifier: "StuCell") as! StudentTableViewCell)

        let stu = stuArray[indexPath.row]

        cell.name.text = stu.name
        cell.age.text = "\(stu.age)"
        cell.gender.text = stu.gender
        cell.grade.text = "\(stu.grade)"

        cell.l.image = UIImage(named: "1")
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stuArray.append(Student(name: "lgy", age: 43, gender: "nan", grade: 1))
        stuArray.append(Student(name: "gyx", age: 42, gender: "nv", grade: 2))
        stuArray.append(Student(name: "lgy", age: 43, gender: "nan", grade: 1))
        stuArray.append(Student(name: "lgy", age: 43, gender: "nan", grade: 1))
        stuArray.append(Student(name: "lgy", age: 43, gender: "nan", grade: 1))
        stuArray.append(Student(name: "lgy", age: 43, gender: "nan", grade: 1))
        stuArray.append(Student(name: "lgy", age: 43, gender: "nan", grade: 1))
        stuArray.append(Student(name: "lgy", age: 43, gender: "nan", grade: 1))
        
    }
    //一定记得delegate代理添加 姓名等信息
    //返回显示信息的方框
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
        
    
}

