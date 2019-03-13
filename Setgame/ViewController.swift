//
//  ViewController.swift
//  Setgame
//
//  Created by Geoffry Gambling on 1/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//



//TODO: The basic population of the decks seems to be working. Next is the logic of picking and comparing cards


import UIKit


//TODO The basic matching logic seems to be working. I think I may want to refactor some functions out of the view controller before doing the replacing cards logic.

class ViewController: UIViewController {

    var deck = SetGameDeck()
    
    var chosenCards = [Card]()
    
    var firstCard = [String]()
    var secondCard = [String]()
    var thirdCard = [String]()
    
    var matchCount = 0
    var matchCard = [String]()
    
    
    @IBAction func cardTouch(_ sender: UIButton) {
        
        
            pickCards(pickedCard: sender)
        
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
            
            
            if deck.cards[x].color.rawValue == "purple" {
                btColor = UIColor.purple
            } else if deck.cards[x].color.rawValue == "red" {
                btColor = UIColor.red
            } else if deck.cards[x].fill.rawValue == "blue" {
                btColor = UIColor.blue
            }
            
            if deck.cards[x].fill.rawValue == "clear" {
                btStroke = 5
                btFloat = 5.00
            } else if deck.cards[x].fill.rawValue == "shaded" {
                btStroke = -5
                btFloat = 0.15
            } else if deck.cards[x].fill.rawValue == "filled" {
                btStroke = -5
                btFloat = 5.00
            }
           
            
            if deck.cards[x].amount.rawValue == "two" {
                btShape = btShape + btShape
            } else if deck.cards[x].amount.rawValue == "three" {
                btShape = btShape + btShape + btShape
            }
            
            changeAtt(btShape, place: x, btStroke: btStroke, btFloat: btFloat, btColor: btColor)
            
            x += 1
        }
        
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
    
    
    //TODO Matching seems to be refactored into the setgamedeck. Need to test further. Also need to have the view controller update to clear selected. 
    func clearChosenColor() {
        
        for i in 0...cardButton.count {
            cardButton[i].layer.borderWidth = 0
            
        }
        
        
        
        
        
        
    }
    
    func pickCards( pickedCard: UIButton) {
        
            if let cardNumber = cardButton.index(of: pickedCard) {
                
                cardButton[cardNumber].layer.borderWidth = 3.0
                cardButton[cardNumber].layer.borderColor = UIColor.blue.cgColor
                
                
                deck.cardPicking(cardNumber: cardNumber)
                
                
            }
        
        
    }
    
}




