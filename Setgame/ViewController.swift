//
//  ViewController.swift
//  Setgame
//
//  Created by Geoffry Gambling on 1/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//



//TODO: The basic population of the decks seems to be working. Next is the logic of picking and comparing cards


import UIKit


//TODO Removing and replacing seems to be working now. The issue seemed to be using a random x function in my populate cards instead of changing it to a shown cards count after creating shown cards. Also switched the populateShownCards function so that it checked whether chosenCards contained shownCards, instead of vice/versa. Also, siwtched to a random number for the showncards to populate from as well as new cards after a match.

class ViewController: UIViewController {

    var deck = SetGameDeck()
    
    var shownCards = [Card]()
    
    var buttonPress = 0
    
    
    var cardIndex = [Int]()
    
    @IBAction func cardTouch(_ sender: UIButton) {
        
        
        pickCards(pickedCard: sender)
        
       
        
       
        
        
    }
    
    
    @IBOutlet var cardButton: [UIButton]! {
        didSet {
            
            newGame()
            populateCards(shownCards: shownCards)
            print(shownCards)
            
        }
    }
    
    func populateShownCards(chosenCards: [Card]) {
        for i in 0..<chosenCards.count {
            if chosenCards[i].isChosen == shownCards[i].isChosen {
                shownCards[i] = deck.cards.remove(at: deck.cards.count.arc4random)
                populateCards(shownCards: [shownCards[i]])
            }
        }
        
    }
    
    func newGame() {
        for i in 0..<cardButton.count {
            shownCards += [deck.cards.remove(at: deck.cards.count.arc4random)]
        }
    }
    
    func populateCards(shownCards: [Card]) {
//       var x = 0
       
        
        for i in 0..<shownCards.count {
            var btStroke : Int!
            var btFloat : Float!
            var btShape = shownCards[i].shape.rawValue
            
            
            var btColor = UIColor.blue
            
            
            
            
            if shownCards[i].color.rawValue == "purple" {
                btColor = UIColor.purple
            } else if shownCards[i].color.rawValue == "red" {
                btColor = UIColor.red
            } else if shownCards[i].fill.rawValue == "blue" {
                btColor = UIColor.blue
            }
            
            if shownCards[i].fill.rawValue == "clear" {
                btStroke = 5
                btFloat = 5.00
            } else if shownCards[i].fill.rawValue == "shaded" {
                btStroke = -5
                btFloat = 0.15
            } else if shownCards[i].fill.rawValue == "filled" {
                btStroke = -5
                btFloat = 5.00
            }
           
            
            if shownCards[i].amount.rawValue == "two" {
                btShape = btShape + btShape
            } else if shownCards[i].amount.rawValue == "three" {
                btShape = btShape + btShape + btShape
            }
            
            changeAtt(btShape, place: i, btStroke: btStroke, btFloat: btFloat, btColor: btColor)
            
//            x += 1
        }
//        print(deck)
        print(shownCards.count)
        print(deck.cards.count)
    }
    
    
    func changeAtt(_ text: String, place: Int, btStroke: Int, btFloat: Float, btColor: UIColor) {
        var textColor: [NSAttributedString.Key: Any] = [
                    .strokeWidth : btStroke,
                    .strokeColor : btColor,
                    .foregroundColor : btColor.withAlphaComponent(CGFloat(btFloat)),
                    .font : UIFont.systemFont(ofSize : 25)
                ]
        
                let textAttributes = NSAttributedString(string: text, attributes: textColor)
                cardButton[place].setAttributedTitle(textAttributes, for: [])
        
            }
    
    
    
   
    
    
    
    func pickCards( pickedCard: UIButton) {
        if buttonPress < 3 {
            buttonPress += 1
            if let cardNumber = cardButton.index(of: pickedCard) {
                
                cardButton[cardNumber].layer.borderWidth = 3.0
                cardButton[cardNumber].layer.borderColor = UIColor.blue.cgColor
                
                cardIndex += [cardNumber]
                
                print("cardnumber", cardNumber)
                
                deck.cardPicking(cardNumber: cardNumber, shownCard: shownCards )
            
                
            }
        
        } else {
            buttonPress = 0
            
            print("shown card", cardIndex[1])
            print("cardIndex", cardIndex)
            for i in 0..<cardIndex.count {
                shownCards[cardIndex[i]] = deck.cards.remove(at: deck.cards.count.arc4random)
                cardButton[cardIndex[i]].layer.borderWidth = 0
                populateCards(shownCards: shownCards)
                
            }
            cardIndex = []
        }
    }
    
}

// This an extension that we will use in emoji function so it can stay cleaner and expressinve instead of that long long chain of modifiers.
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}


