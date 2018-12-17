//
//  Concentration.swift
//  GameMvc
//
//  Created by student on 2018/12/6.
//  Copyright © 2018年 huxiaodong. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()//代替数组Array<Card>
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){//消除相同的
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard,matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfParisOfCards: Int) {
        for _ in 0..<numberOfParisOfCards {
            let card = Card()
            cards += [card, card]  //类似于cards.append(card),cards.append(card)

        }
    }
}
