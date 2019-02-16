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
    
    
    
    
    //    TODO: finish the logic here. I am trying to get a border around picked cards
    @IBAction func cardTouch(_ sender: UIButton) {
        if let cardNumber = cardButton.index(of: sender) {
            deck.cards[cardNumber].isChosen = true
            
            deck.findPickedCardes()
            
//            print(deck.cards[cardNumber])
        }
        
        
        
    }
    
    
    
    
    
    
    @IBOutlet var cardButton: [UIButton]! {
        didSet {
            
//            changeAtt("☁︎", shade: 0.15, color: UIColor.blue, amount: 2)
            populateCards()
            print(deck.cards.count)
            
        }
    }
    
    
    func populateCards() {
        var x = 0
        var btColor = UIColor.purple
       
        
        for _ in cardButton{
            var btStroke : Int!
            var btFloat : Float!
            var btShape = deck.cards[x].shape.rawValue
            
            
            if deck.cards[x].color.rawValue == "blue" {
                btColor = UIColor.blue
            } else if deck.cards[x].color.rawValue == "red" {
                btColor = UIColor.red
            } else if deck.cards[x].fill.rawValue == "purple" {
                btColor = UIColor.purple
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




