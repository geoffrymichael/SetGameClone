//
//  ViewController.swift
//  Setgame
//
//  Created by Geoffry Gambling on 1/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//



//TODO: The basic population of the decks seems to be working. Next is the logic of picking and comparing cards


import UIKit


//TODO Lots of revision happened. I hope I just need some fine tuning on the matching logic. To work on next, is the errors I am getting in the matching function. Things seems to work on the first go around, but not on further rounds. I think I have missed clearing out a type. Everything copied out for core graphics implimentation

class ViewController: UIViewController {

    
    @IBOutlet weak var playingCardView: playingCardView! {
        didSet {
//            playingCardView.autoresizesSubviews = true
            playingCardView.newGame()
        }
    }
    
    @IBAction func drawThreeButton(_ sender: UIButton) {
        
        playingCardView.drawThree()
        
        
    }
    
    
    
    override func viewDidLoad() {
        
        print("Count at load", playingCardView.shownCards.count)
    }
    
    
//    override func viewDidLoad() {
//        self.view.addSubview(playingCardView)
//    }
    
    
    
}
//
//// This an extension that we will use in emoji function so it can stay cleaner and expressinve instead of that long long chain of modifiers.



