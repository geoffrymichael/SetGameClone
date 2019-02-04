//
//  ViewController.swift
//  Setgame
//
//  Created by Geoffry Gambling on 1/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //TODO Was able to finally figure out a nested for loop algorithm to at least populate and array with 81 groupings of 3 distinct features of Ints from 0 through 2
  
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
            print(cards)
                print(cards.count)
            }
        }
    }

    
    @IBOutlet var cardText: [UIButton]! {
        didSet {
            populateCards()
        }
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


