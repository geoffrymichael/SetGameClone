//
//  ViewController.swift
//  Setgame
//
//  Created by Geoffry Gambling on 1/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var deck = SwiftGameDeck()
    
    
    
    
    var x = 0
    
    
    func populateCards() {
        for i in cardButton{
            var btStroke : Int!
            var btFloat : Float!
            
            
            //TODO: Even if a bit verbose, I was able to create code that can iterate through the deck of cards and display different shapes and shadings. However, changing the color does not seem to work. for some reason, some cards are defaulting tothe default UIColor.
            var btColor = UIColor.blue
            
            
//            if deck.cards[x].color.rawValue == "blue" {
//                btColor = UIColor.blue
//            } else if deck.cards[x].color.rawValue == "red" {
//                btColor = UIColor.red
//            } else if deck.cards[x].fill.rawValue == "purple" {
//                btColor = UIColor.purple
//            }
//
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
            
            changeAtt(deck.cards[x].shape.rawValue, place: x, btStroke: btStroke, btFloat: btFloat, btColor: btColor)
//            cardButton[x].setTitle(deck.cards[x].shape.rawValue, for: [])
            x += 1
        }
        
    }
    
    
    
    @IBOutlet var cardButton: [UIButton]! {
        didSet {
            
//            changeAtt("☁︎", shade: 0.15, color: UIColor.blue, amount: 2)
            populateCards()
            print(deck.cards.count)
            
        }
    }
    
//    func changeAtt(_ text: String, shade: Float, color: UIColor, amount: Int) {
//        var textColor: [NSAttributedString.Key: Any] = [
//            .strokeWidth : -5,
//            .strokeColor : color,
//            .foregroundColor : color.withAlphaComponent(CGFloat(shade)),
//            .font : UIFont.systemFont(ofSize : 20)
//
//        ]
//
//        let textAttributes = NSAttributedString(string: text, attributes: textColor)
//        cardButton[0].setAttributedTitle(textAttributes, for: [])
//
//    )
    
    
    func changeAtt(_ text: String, place: Int, btStroke: Int, btFloat: Float, btColor: UIColor) {
        var textColor: [NSAttributedString.Key: Any] = [
                    .strokeWidth : btStroke,
                    .strokeColor : btColor,
                    .foregroundColor : btColor.withAlphaComponent(CGFloat(btFloat)),
                    .font : UIFont.systemFont(ofSize : 40)
        
                ]
        
                let textAttributes = NSAttributedString(string: text, attributes: textColor)
                cardButton[place].setAttributedTitle(textAttributes, for: [])
        
            }
    
 
    
}




