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
    
    
    
    //    TODO: Trying out a refactor using an array to keepy track of picked cards. I have not removed the isChosen from the card though yet. Able to put a border around chosen cards, but need to be able to max the picked cards to three and reset isChosen to 0 if cards do not match or remove the three cards if they are matched. 
    @IBAction func cardTouch(_ sender: UIButton) {
        
        if chosenCards.count < 3 {
            if let cardNumber = cardButton.index(of: sender) {
                
                cardButton[cardNumber].layer.borderWidth = 3.0
                cardButton[cardNumber].layer.borderColor = UIColor.blue.cgColor
                
                chosenCards.append(deck.cards[cardNumber])
                
            }
            
            
            

        }
       
        
        print(chosenCards)
        print(chosenCards.count)
        
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




