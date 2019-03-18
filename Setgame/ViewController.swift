//
//  ViewController.swift
//  Setgame
//
//  Created by Geoffry Gambling on 1/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//



//TODO: The basic population of the decks seems to be working. Next is the logic of picking and comparing cards


import UIKit


//TODO Started messing around with replacing matched cards. Not really working yet. Cards are getting replaced, but they appear to be at randomm. Also note you have commented out some things in setgamedeck like clearChosen() to test functionality.    OF COURSE, one problem is when you call populate cards again it clears out twelve more cards from deck.

class ViewController: UIViewController {

    var deck = SetGameDeck()
    
    var shownCards = [Card]()
    
    var buttonPress = 0
    
    @IBAction func cardTouch(_ sender: UIButton) {
        
        
        pickCards(pickedCard: sender)
        
        buttonPress += 1
        
        if buttonPress == 3 {
            clearChosenColor()
            var chosenCards = deck.removeMatchedCards(shownCards: shownCards)
            print(chosenCards)
            populateShownCards(chosenCards: chosenCards)
            populateCards(shownCards: shownCards)
            
        }
        
        
    }
    
    
    @IBOutlet var cardButton: [UIButton]! {
        didSet {
            
            newGame()
            populateCards(shownCards: shownCards)
            
        }
    }
    
    func populateShownCards(chosenCards: [Card]) {
        for i in 0..<chosenCards.count {
            if shownCards.contains(chosenCards[i]) {
                shownCards[i] = deck.cards[i]
            }
        }
        
    }
    
    func newGame() {
        for i in 0..<cardButton.count {
            shownCards += [deck.cards.remove(at: i)]
        }
    }
    
    func populateCards(shownCards: [Card]) {
       var x = 0
       
        
        for _ in cardButton{
            var btStroke : Int!
            var btFloat : Float!
            var btShape = deck.cards[x].shape.rawValue
            
            
            var btColor = UIColor.blue
            
            
            
            
            if shownCards[x].color.rawValue == "purple" {
                btColor = UIColor.purple
            } else if shownCards[x].color.rawValue == "red" {
                btColor = UIColor.red
            } else if shownCards[x].fill.rawValue == "blue" {
                btColor = UIColor.blue
            }
            
            if shownCards[x].fill.rawValue == "clear" {
                btStroke = 5
                btFloat = 5.00
            } else if shownCards[x].fill.rawValue == "shaded" {
                btStroke = -5
                btFloat = 0.15
            } else if shownCards[x].fill.rawValue == "filled" {
                btStroke = -5
                btFloat = 5.00
            }
           
            
            if shownCards[x].amount.rawValue == "two" {
                btShape = btShape + btShape
            } else if shownCards[x].amount.rawValue == "three" {
                btShape = btShape + btShape + btShape
            }
            
            changeAtt(btShape, place: x, btStroke: btStroke, btFloat: btFloat, btColor: btColor)
            
            x += 1
        }
        print(deck)
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
    
    
    
    func clearChosenColor() {
        
        for i in 0..<cardButton.count {
            cardButton[i].layer.borderWidth = 0
            
        }
        buttonPress = 0
        
    }
    
    func pickCards( pickedCard: UIButton) {
        
            if let cardNumber = cardButton.index(of: pickedCard) {
                
                cardButton[cardNumber].layer.borderWidth = 3.0
                cardButton[cardNumber].layer.borderColor = UIColor.blue.cgColor
                
                
                deck.cardPicking(cardNumber: cardNumber, shownCard: shownCards )
                
                
            }
        
        
    }
    
}




