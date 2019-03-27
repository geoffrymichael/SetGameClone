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
    
    //Keeps track of the selected cards
    var chosenCards = [Card]()
    
    //Raw comparison data for the cards. Extracts the data into three equatable dictionaries.
    var firstCard = [String]()
    var secondCard = [String]()
    var thirdCard = [String]()
    
    //Keeps track of matchcount and what those matched attributes are.
    var matchCount = 0
    var matchCard = [String]()
    
    //A unique intiger attached to each card to keep track of them.
    var identifier = 0
    
    init() {
        for shape in Card.Shape.all {
            for color in Card.Color.all {
                for fill in Card.Fill.all {
                    for amount in Card.Amount.all {
                        cards.append(Card(shape: shape, color: color, fill: fill, amount: amount, isChosen: identifier))
                        identifier += 1
                    }
                }
            }
        }
        cards.shuffle()
    }

    
   
    //Extracts the raw data of selected cards into equatable dictionary and also keeps track of selected cards.
    mutating func cardPicking(cardNumber: Int, shownCard: [Card]) {
        
        
        
        chosenCards.append(shownCard[cardNumber])
        

        
        if chosenCards.count == 1 {
            firstCard = [chosenCards[0].shape.rawValue, chosenCards[0].color.rawValue, chosenCards[0].fill.rawValue, chosenCards[0].amount.rawValue]
            print(firstCard, "asdfasdfasdfasdfasdf")
        } else if chosenCards.count == 2 {
            secondCard = [chosenCards[1].shape.rawValue, chosenCards[1].color.rawValue, chosenCards[1].fill.rawValue, chosenCards[1].amount.rawValue]
            print(secondCard, "this is the second card")
        } else if chosenCards.count == 3  {
            thirdCard = [chosenCards[2].shape.rawValue, chosenCards[2].color.rawValue, chosenCards[2].fill.rawValue, chosenCards[2].amount.rawValue]
            print("this is the third card", thirdCard)
            
            
            
        } 

        //TODO Refactor card matching from view controller
        
        
    }
    
    //Depending on the first two cards picked, compares three cards against eachother against set conditions. If there is a set, the function will evaluate to true. Else, false.
    mutating func cardMatching() -> Bool {
        var isMatched = true
        for i in 0...3 {
            
            if firstCard.contains(secondCard[i]) {
                matchCount += 1
                matchCard += [secondCard[i]]
                print("this is how many matches we have now", matchCount, matchCard)
                
 
            }
            
        }
        
        if matchCount == 0 {
            for i in 0...3 {
                if firstCard.contains(thirdCard[i]) {
                    matchCount += 1
                }
                if secondCard.contains(thirdCard[i]) {
                    matchCount += 1
                }
            }
            if matchCount > 0 {
                print("no set of all different")
                isMatched = false
            } else {
                print("set of no matches")
                isMatched = true
                
            }
        }
            
        else if matchCount == 1 {
            
            let singleMatchOne = firstCard.filter{ $0 != matchCard[0]}
            let singleMatchTwo = secondCard.filter{ $0 != matchCard[0]}
            
            let compareCard = singleMatchOne + singleMatchTwo
            
            if thirdCard.contains(matchCard[0]) {
                for i in 0..<thirdCard.count {
                    if compareCard.contains(thirdCard[i]) {
                        matchCount += 1
                    }
                }
            } else {
                matchCount += 1
            }
            
            
            print(compareCard)

            if matchCount  == 1 {
                print("Set of single attributes")
                isMatched = true
            } else {
                print("No set of single attributes")
                isMatched = false
            }
        }
            
        else if matchCount == 2 {
            let doubleMatchOne = firstCard.filter{ $0 != matchCard[0] && $0 != matchCard[1]}
            let doubleMatchTwo = firstCard.filter{ $0 != matchCard[0] && $0 != matchCard[1]}
            
            let compareDoubleMatch = doubleMatchOne + doubleMatchTwo
            
            if thirdCard.contains(matchCard[0]) && thirdCard.contains(matchCard[1]) {
                for i in 0..<thirdCard.count {
                    if compareDoubleMatch.contains(thirdCard[i]) {
                        matchCount += 1
                    }
                }
            } else {
                matchCount += 1
            }
            
            if matchCount == 2 {
                print("Set of two attributes")
                isMatched = true
            } else {
                print("No set of two attributes")
                isMatched = false
            }
        }
            
        else if matchCount == 3 {
            for i in 0..<thirdCard.count {
                if matchCard.contains(thirdCard[i]) {
                    matchCount += 1
                }
            }
            
            if matchCount == 6 {
                print("Set of three matches")
                isMatched = true
            } else {
                print("No set of three matches")
                isMatched = false
            }
        }
        
        chosenCards = []
        matchCard = []
        matchCount = 0
        return isMatched

        
    }

    
    mutating func clearChosen() {
        chosenCards = []
        matchCount = 0
        matchCard = []
        print(chosenCards)
        print(chosenCards.count)
    }
    
}


