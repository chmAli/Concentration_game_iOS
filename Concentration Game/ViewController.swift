//
//  ViewController.swift
//  Concentration Game
//
//  Created by Ali Shan on 10/17/18.
//  Copyright © 2018 Tintash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numOfPairOfCards: (cardButtons.count+1) / 2)
    
    @IBOutlet weak var flipCountUI: UITextField!

    var flipCount = 0{
        didSet{
            flipCountUI.text = "Flips : \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    var emojiList = ["🤪", "👊", "😈", "👻", "⚽️", "⭐️", "☃️", "🇵🇰"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1

        if let cardNumber = cardButtons.index(of:sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("Card is not found in list")
        }
        
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cardsList[index]
            if card.isFaceUp{
                button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                button.setTitle(getEmoji(at:card), for: .normal)
            }else{
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.setTitle("", for: .normal)
            }
        }
    }
    
    var emojiDict = [Int:String]()
    
    func getEmoji(at card:Card) -> String{
        if emojiDict[card.identifier] == nil, emojiList.count > 0{
            let random = Int(arc4random_uniform(UInt32(emojiList.count)))
            emojiDict[card.identifier] = emojiList.remove(at: random)
        }
        return emojiDict[card.identifier] ?? "?"
    }
    
}

