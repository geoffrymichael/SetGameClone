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
        for i in deck.cards {
            print(deck.cards[x])
            x += 1
        }
    }
    
    
    @IBOutlet var cardButton: [UIButton]! {
        didSet {
            
            changeAtt("☁︎", shade: 0.15, color: UIColor.blue, amount: 2)
            populateCards()
            
        }
    }
    
    func changeAtt(_ text: String, shade: Float, color: UIColor, amount: Int) {
        var textColor: [NSAttributedString.Key: Any] = [
            .strokeWidth : -5,
            .strokeColor : color,
            .foregroundColor : color.withAlphaComponent(CGFloat(shade)),
            .font : UIFont.systemFont(ofSize : 20)
            
        ]
        
        let textAttributes = NSAttributedString(string: text, attributes: textColor)
        cardButton[0].setAttributedTitle(textAttributes, for: [])
        
    }
    
    
 
    
}




