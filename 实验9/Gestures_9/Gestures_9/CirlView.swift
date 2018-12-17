//
//  CirlView.swift
//  Gestures_9
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import UIKit

@IBDesignable
class CirlView: UIView {

    @IBInspectable var fillColor:UIColor?
    @IBInspectable var strokeColor: UIColor?
    
    
    func setup()  {
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        self.addGestureRecognizer(panRecognizer)
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        self.addGestureRecognizer(pinchRecognizer)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func tap(recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            print("double clicked me")
        default:
            break
        }
    }
    
    @objc func pinch(recognizer: UIPinchGestureRecognizer) {//产生两个s手指控制功能，类适于两手放大和缩小
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            bounds.size = CGSize(width: bounds.width * recognizer.scale, height: bounds.height * recognizer.scale)//可以产生放大放小
            recognizer.scale = 1
        default:
            break
        }
    }
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        //print("pan")
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self)
            center.x += translation.x
            center.y += translation.y
            recognizer.setTranslation(.zero, in: self)//跟随鼠标移动
        default:
            break
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    //画椭圆
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath(ovalIn: rect)
        fillColor?.setFill()
        strokeColor?.setStroke()
        path.fill()
        path.stroke()
    }
    

}
