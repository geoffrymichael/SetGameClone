//
//  ViewController.swift
//  Setgame
//
//  Created by Geoffry Gambling on 1/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//



//TODO: The basic population of the decks seems to be working. Next is the logic of picking and comparing cards


import UIKit

class ViewController: UIViewController {

    var deck = SetGameDeck()
    
    var chosenCards = [Card]()
    
    
    
    //    TODO: Able to clear the chosenCards array and clear borders when clicking on third card. This woud be used when the cards dont match set conditions. Need to figure out set conditions.
    @IBAction func cardTouch(_ sender: UIButton) {
        
        if chosenCards.count < 2 {
            if let cardNumber = cardButton.index(of: sender) {
                
                cardButton[cardNumber].layer.borderWidth = 3.0
                cardButton[cardNumber].layer.borderColor = UIColor.blue.cgColor
                
                chosenCards.append(deck.cards[cardNumber])
                
                
            }

        } 
    
        
        else {
            var x = 0
            for i in cardButton {
                cardButton[x].layer.borderWidth = 0
                x += 1
            }
            chosenCards = []
        }
       
        
        print(chosenCards)
        print(chosenCards.count)
        
        
        //TODO Still Testing out comparing equatable values. 
        var firstCard = [String]()
        firstCard   = [chosenCards[0].shape.rawValue, chosenCards[0].color.rawValue]
        var secondCard = [chosenCards[0].shape.rawValue, chosenCards[0].color.rawValue]
        print(firstCard.contains(secondCard[0]))
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
                btStroke = -5
                btFloat = 5.00
            } else if deck.cards[x].fill.rawValue == "shaded" {
                btStroke = -5
                btFloat = 0.15
            } else if deck.cards[x].fill.rawValue == "filled" {
                btStroke = 5
                btFloat = 5.00
            }
            
            
            
            
            if deck.cards[x].amount.rawValue == 2 {
                btShape = btShape + btShape
            } else if deck.cards[x].amount.rawValue == 3 {
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
    
 
    
}




