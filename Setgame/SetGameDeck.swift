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
    
    var chosenCards = [Card]()
    
    var firstCard = [String]()
    var secondCard = [String]()
    var thirdCard = [String]()
    
    var matchCount = 0
    var matchCard = [String]()
    
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

    
   
    
    mutating func cardPicking(cardNumber: Int) {
        
        
        
        chosenCards.append(cards[cardNumber])
        

        
        if chosenCards.count == 1 {
            firstCard = [chosenCards[0].shape.rawValue, chosenCards[0].color.rawValue, chosenCards[0].fill.rawValue, chosenCards[0].amount.rawValue]
            print(firstCard, "asdfasdfasdfasdfasdf")
        } else if chosenCards.count == 2 {
            secondCard = [chosenCards[1].shape.rawValue, chosenCards[1].color.rawValue, chosenCards[1].fill.rawValue, chosenCards[1].amount.rawValue]
            print(secondCard, "this is the second card")
        } else if chosenCards.count == 3  {
            thirdCard = [chosenCards[2].shape.rawValue, chosenCards[2].color.rawValue, chosenCards[2].fill.rawValue, chosenCards[2].amount.rawValue]
            print("this is the third card", thirdCard)
            cardMatching()
            clearChosen()
            
        }

        //TODO Refactor card matching from view controller
        
        
    }
    mutating func cardMatching() {
        for i in 0...chosenCards.count {
            
            if firstCard.contains(secondCard[i]) {
                matchCount += 1
                matchCard += [secondCard[i]]
                print("this is how many matches we have now", matchCount, matchCard)
                
                
            }
            
        }
        
        if matchCount == 0 {
            for i in 0...3 {
                if firstCard.contains(thirdCard[i])  {
                    matchCount += 1
                    if secondCard.contains(thirdCard[i]) {
                        matchCount += 1
                    }
                }
                
            }
            if matchCount > 0 {
                print("no set of all different")
            } else {
                print("set of no matches")
            }
        }
            
        else if matchCount == 1 {
            
            for i in 0...3 {
                
                if firstCard.contains(thirdCard[i]) {
                    matchCount += 1
                    if secondCard.contains(thirdCard[i]) {
                        matchCount += 1
                    }
                }
            }
            if matchCount  == 3 {
                print("Set of single attributes")
            } else {
                print("No set of single attributes")
            }
        }
            
        else if matchCount == 2 {
            for i in 0...3 {
                if firstCard.contains(thirdCard[i])  {
                    matchCount += 1
                    if secondCard.contains(thirdCard[i]) {
                        matchCount += 1
                    }
                }
            }
            if matchCount == 6 {
                print("Set of two attributes")
            } else {
                print("No set of two attributes")
            }
        }
            
        else if matchCount == 3 {
            for i in 0...3 {
                if firstCard.contains(thirdCard[i])   {
                    matchCount += 1
                    if secondCard.contains(thirdCard[i]) {
                        matchCount += 1
                    }
                    
                }
            }
            if matchCount == 9 {
                print("Set of three matches")
            } else {
                print("No set of three matches")
            }
        }
    }
    
    mutating func clearChosen() {
        chosenCards = []
        matchCount = 0
        matchCard = []
        print(chosenCards)
        print(chosenCards.count)
    }
    
}


