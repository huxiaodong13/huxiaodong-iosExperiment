//
//  MyTableViewCell.swift
//  TableviewAndTableField2
//
//  Created by student on 2018/11/8.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    //@IBOutlet weak var ima: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
