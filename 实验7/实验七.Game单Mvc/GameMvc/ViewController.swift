//
//  ViewController.swift
//  GameMvc
//
//  Created by student on 2018/12/6.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //不能在属性初始化器中使用实例成员“cardButton”,“初始化”之前的属性初始化器可用
    //var game = Concentration(numberOfParisOfCards: (cardButton.count +1) / 2)
    lazy var game: Concentration = Concentration(numberOfParisOfCards: (cardButton.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips:\(flipCount)"
            //flipCL.text = "Flips:\(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButton: [UIButton]!
    
    @IBOutlet weak var flipCL: UIButton!//解决横屏，积分
    var emojiChoices = ["👻","☃️","❄️","🤡","🎂","🍬","🐳","🎃","🤖","🤶","🎅","🍔","🍭"]//创造emoji数组
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        //if.else检测点击是否有效
        if let cardNumber = cardButton.index(of: sender) {
//            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)//显示emoji
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("chosen card was not in cardButton")
        }
        
    }
    
    func updateViewFromModel() {//代替以前的flipCard出现
        for index in cardButton.indices {
            let button = cardButton[index]
            let  card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else {
                button.setTitle("", for: UIControl.State.normal)
                //如果匹配就清除
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.9978019595, blue: 0.9611478448, alpha: 0) : #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        }
    }
    
    var emoji = [Int:String]() //Dictionary<Int,String>()
    func emoji(for card: Card) -> String {//随机出现emoji
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
          
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
//    func flipCard(withEmoji emoji:String, on button: UIButton)  {
//        if button.currentTitle == emoji {
//            button.setTitle("", for: UIControl.State.normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 0.530992806, blue: 0, alpha: 1)
//        }else {
//            button.setTitle(emoji, for: UIControl.State.normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        }
//
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

