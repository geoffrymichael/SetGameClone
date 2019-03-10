//
//  SetGameDeck.swift
//  Setgame
//
//  Created by Geoffry Gambling on 2/12/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//

import Foundation

struct SetGameDeck {
    
    var cards = [Card]()
    
    init() {
        for shape in Card.Shape.all {
            for color in Card.Color.all {
                for fill in Card.Fill.all {
                    for amount in Card.Amount.all {
                        cards.append(Card(shape: shape, color: color, fill: fill, amount: amount, isChosen: false))
                    }
                }
            }
        }
        cards.shuffle()
    }

    
    

    
    
    func cardMatching() {
        
        
        //TODO Refactor card matching from view controller
        
        
    }
    
    
    
}

extension Collection {
    //this usues the Collection methods
    //then we create and array that will be an element.
    //then we say if the count of our element if the count ois equal to one, otherwise = nil
    var oneAndOnly: Element? {
        
        return count == 1 ? first : nil
    }
}
