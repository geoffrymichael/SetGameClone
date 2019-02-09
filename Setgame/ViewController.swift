//
//  ViewController.swift
//  Setgame
//
//  Created by Geoffry Gambling on 1/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
  
    var cards = [Card]()
    
    func populateCards() {
        for a in 0...2 {
            for b in 0...2 {
                for c in 0...2 {
                    for d in 0...2 {
                        var card = Card(shape: a, color: b, fill: c, amount: d)
                        cards.append(card)
                    }
                }
                
            }
        }
    }

    
    @IBOutlet var cardText: [UIButton]! {
        didSet {
            populateCards()
            print(cards)
            print(cards.count)
            
            forSquare()
        }
    }
    
    // TODO Working on testing out arrays of attributes and inserting in a function to fill a deck accordingly. 
    func forSquare() {
        var text = "▲"
//        var text = ["▲","■", "⚫︎"]
        var colors = [UIColor.red, UIColor.blue, UIColor.green]
        var fills = [-5,5,-0.15]
        var amounts = [text, text + text, text + text + text]
        
        var textColor: [NSAttributedString.Key: Any] = [
                    .strokeWidth : fills[0],
                    .strokeColor : colors[2],
                    .foregroundColor : colors[2].withAlphaComponent(CGFloat(-fills[2])),
                    .font : UIFont.systemFont(ofSize : 20)
        
                ]
    
        let textAttributes = NSAttributedString(string: amounts[2], attributes: textColor)
                cardText[0].setAttributedTitle(textAttributes, for: [])
        
    }
    
    
    
    
    
//    private func colorizeText()  {
//        var textColor: [NSAttributedString.Key: Any] = [
//            .strokeWidth : -5,
//            .strokeColor : UIColor.red,
//            .foregroundColor : UIColor.red.withAlphaComponent(CGFloat(shaded[1])),
//            .font : UIFont.systemFont(ofSize : 50)
//
//        ]
//
//
//        let textAttributes = NSAttributedString(string: text, attributes: textColor)
//        cardText[cardPlace].setAttributedTitle(textAttributes, for: [])
//        cardPlace += 1
//
//
//    }
    
    
    
    

    //     MARK Stopping point. Placeholder is a single card symbol but with the attribute settngs working in func cardChange()

    
    
    //    private func cardChange() {
//
//        var colorText: [NSAttributedString.Key: Any] = [
//            .strokeWidth : -5,
//
//            .foregroundColor : UIColor.black.withAlphaComponent(100),
//            .font : UIFont.systemFont(ofSize : 50)
//
//            ]
//
//        let  cardAttributes = NSAttributedString(string: text, attributes: colorText)
//
//        cardText.setAttributedTitle(cardAttributes, for: [])
//
//
//    }

}


