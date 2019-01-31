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
            cardChange()
        }
    }
    
    var text = "\u{25B2}"

//     MARK Stopping point. Placeholder is a single card symbol but with the attribute settings working in func cardChange()
    private func cardChange() {
       
        var colorText: [NSAttributedString.Key: Any] = [
//            .strokeWidth : -5,

            .foregroundColor : UIColor.black.withAlphaComponent(0.15),
            .font : UIFont.systemFont(ofSize : 50)
            
            ]
        
        let  cardAttributes = NSAttributedString(string: text, attributes: colorText)
       
        cardText.setAttributedTitle(cardAttributes, for: [])


    }

}


