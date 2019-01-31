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
    


    // MARK Stopping point. PLaceholder Three Triangles
    private func cardChange() {
        cardText.setTitle("\u{25B2} \u{25B2} \u{25B2}", for: [])
        cardText.setTitleColor(#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), for: [])
        cardText.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
    }
    
    
    
}


