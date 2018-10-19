//
//  Card.swift
//  Concentration Game
//
//  Created by Ali Shan on 10/19/18.
//  Copyright © 2018 Tintash. All rights reserved.
//

import Foundation

struct Card{
    var identifier:Int
    var isFaceUp = false
    var isMatched = false
    
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int{
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init(){
        identifier = Card.getUniqueIdentifier()
    }
    
}
