//
//  ViewController.swift
//  Setgame
//
//  Created by Geoffry Gambling on 1/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//



//TODO: The basic population of the decks seems to be working. Next is the logic of picking and comparing cards


import UIKit


//TODO I have had the populate function remove cards from the total deck for the cards shown. These cards are then used to pick cards from when clicked on. Need to be able remove these cards and replace these cards in shownCards from the deck and update the view. Also created a unique Int in the card as in identifier. Not sure if this needed or will work to track individual cards. 

class ViewController: UIViewController {

    var deck = SetGameDeck()
    
    var shownCards = [Card]()
    
    var buttonPress = 0
    
    @IBAction func cardTouch(_ sender: UIButton) {
        
        
        pickCards(pickedCard: sender)
        
        buttonPress += 1
        
        if buttonPress == 3 {
            clearChosenColor()
        }
        
        
    }

    
    @IBOutlet var cardButton: [UIButton]! {
        didSet {
            
            populateCards()
            
        }
    }
    
    
    func populateCards() {
       var x = 0
       
        
        for _ in cardButton{
            var btStroke : Int!
            var btFloat : Float!
            var btShape = deck.cards[x].shape.rawValue
            
            
            var btColor = UIColor.blue
            
            
            shownCards += [deck.cards.remove(at: x)]
            
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




