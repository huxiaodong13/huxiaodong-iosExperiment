//
//  ViewController.swift
//  TableviewAndTableField2
//
//  Created by student on 2018/11/8.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chooseLabel: UILabel!
    
    var stuArray = [String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//返回多少个
        return stuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MyTableViewCell
        
        cell.myLabel.text = stuArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chooseLabel.text = "You choose: \(stuArray[indexPath.row])"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            stuArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let name = stuArray.remove(at: sourceIndexPath.row)
        stuArray.insert(name, at: destinationIndexPath.row)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stuArray.append("Hutuuu")
        stuArray.append("LiHaa")
    }
    
    @IBAction func Add(_ sender: Any) {
        if let name = nameTextField.text {
            stuArray.append(name)
            tableView.reloadData()
            nameTextField.resignFirstResponder()
        }
    }
    
    @IBAction func Edit(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
}

