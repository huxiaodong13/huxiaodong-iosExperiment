//
//  personTableViewController.swift
//  coreDate13
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 2016110313. All rights reserved.
//

import UIKit
import CoreData

class personTableViewController: UITableViewController {

    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate //拿到自己的代理
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //显示所有人的列表
    var persons:[Person]?
    fileprivate func reloadData() {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        persons = try? context.fetch(fetch)
        tableView.reloadData()//刷新
    }
    
    override func viewDidLoad() {
        reloadData()//因为不需要条件，所以s直接查
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 //只有一个
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return persons?.count ?? 0 //当option值为空时，就默认为0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let p = persons?[indexPath.row] {//如果有内容就取她
            cell.textLabel?.text = p.name
        }
        // Configure the cell...

        return cell
    }
    //刷新
    override func viewWillDisappear(_ animated: Bool) {
        reloadData()
        //当然数据也需要更新
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        //拿到新的控制器
        if segue.identifier == "ShowDetail" {
            let secVC = segue.destination as! detailViewController
            if let indexPath = tableView.indexPath(for:sender as!UITableViewCell),let person = persons?[indexPath.row] {
                secVC.person = person
            }
            
        }
    }
    

}
