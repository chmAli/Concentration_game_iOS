//
//  Concentration.swift
//  Concentration Game
//
//  Created by Ali Shan on 10/19/18.
//  Copyright © 2018 Tintash. All rights reserved.
//

import Foundation

class Concentration{
    
    var cardsList = [Card]()
    
    var indexOfFirstCard: Int?
    
    init (numOfPairOfCards:Int){
        for _ in 0..<numOfPairOfCards{
            let card = Card()
            cardsList += [card, card]
        }
        
        // TODO: shuffle the cards
        cardsList.shuffle()
    }
    
    func chooseCard(at index:Int){
        if !cardsList[index].isMatched{
            if let matchIndex=indexOfFirstCard, matchIndex != index{
                // check if cards match
                if cardsList[matchIndex].identifier == cardsList[index].identifier{
                    cardsList[index].isMatched = true
                    cardsList[matchIndex].isMatched = true
                }
                cardsList[index].isFaceUp = true;
                indexOfFirstCard = nil
            }else{
                // either no cards or 2 cards are faced up
                for flipDownIndex in cardsList.indices{
                    cardsList[flipDownIndex].isFaceUp = false
                }
                cardsList[index].isFaceUp = true
                indexOfFirstCard = index
            }
        }
    }
    
}
