//
//  ViewController.swift
//  Setgame
//
//  Created by Geoffry Gambling on 1/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        
    }
    
    
    
    @IBOutlet weak var cardText: UIButton!{
        didSet {
            colorizeText()
        }
    }
    
    var triangle = "\u{25B2}"
    var square = "\u{25A0}"
    var circle = "\u{25CF}"

    var text = "\u{25B2}"

    
    var shaded =  [100, 0.15]
    
    
    
    // More testing of attributes. Need to find a way to set strokewidth becuase it always overrides any settings on foreground color
    private func colorizeText() {
        var textColor: [NSAttributedString.Key: Any] = [
            .strokeWidth : 5,
            .foregroundColor : UIColor.black.withAlphaComponent(CGFloat(shaded[0])),
            .font : UIFont.systemFont(ofSize : 50)
            
        ]
        
        let textAttributes = NSAttributedString(string: text, attributes: textColor)
        cardText.setAttributedTitle(textAttributes, for: [])
        
    }
    

//     MARK Stopping point. Placeholder is a single card symbol but with the attribute settings working in func cardChange()

    
    
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


