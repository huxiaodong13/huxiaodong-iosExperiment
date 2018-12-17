//
//  ViewController.swift
//  Dynamicdemo3
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backview: UIView!
    lazy var animator = UIDynamicAnimator(referenceView: self.backview)
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        collision.translatesReferenceBoundsIntoBoundary = true
    }

    @IBAction func add(_ sender: Any) {
        let width = Int(backview.bounds.width / 10)
        let randx = Int(arc4random() % 10) * width
        let label = UILabel(frame: CGRect(x: randx, y: 0, width: width, height: width))
        label.backgroundColor = UIColor.red
        label.text = "A"
        label.textAlignment = .center
        backview.addSubview(label)
        
        gravity.addItem(label)
        collision.addItem(label)
        
    }
    
    @IBAction func up(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    @IBAction func down(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
    }
    @IBAction func left(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    @IBAction func right(_ sender: Any) {
        gravity.gravityDirection =  CGVector(dx: 1, dy: 0)
    }
    @IBAction func deleteAll(_ sender: Any?) {
        for item in self.backview.subviews {
            if item is UILabel {
                item.removeFromSuperview()
            }
        }
    }
    
}

