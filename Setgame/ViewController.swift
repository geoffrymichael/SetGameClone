//
//  ViewController.swift
//  Setgame
//
//  Created by Geoffry Gambling on 1/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//



//TODO: The basic population of the decks seems to be working. Next is the logic of picking and comparing cards


import UIKit




class ViewController: UIViewController, changeLabelDelegate {
    
    //Calling the playingCardView score changed function to update the label on this viewcontroller with the data created in out from the playingCardView.
    func scoreChanged(score: Int) {
        scoreLabel.text = "Score: \(gameView.score)"
    }
    
   
    @IBOutlet weak var gameView: GameTableView!
    
    @IBAction func drawThreeButton(_ sender: UIButton) {
        gameView.drawThree()
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func newGameButton(_ sender: UIButton) {
        gameView.newGame()
        scoreLabel.text = "Score: 0"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gameView.delegate = self
        
        scoreLabel.text = "Score: 0"
        
        gameView.newGame()
        
    }
    
    

    
    
    
}




