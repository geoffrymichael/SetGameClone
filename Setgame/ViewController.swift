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

    var deck = SetGameDeck()
    
    
    
    @IBOutlet weak var gameboardView: GameboardView! {
        didSet {
            gameboardView.newGame()
        }
    }
    
    override func viewDidLoad() {
        
    }
   
    
    
    
    
    
    
    
    override func viewDidLayoutSubviews() {
        
        
        self.view.addSubview(gameboardView)
        
        
        //Declare a grid. This is a standin as it is static for a 12 view grid
        
        
        //The 0...11 here is just a standin for initially putting twelve cards in the view
       
        
//        print(subviews[0].tag)
        
        
        //TODO This is accessing the autolayout card. Maybe it should be replaced by attributes of first card in deck data set.
//
        
//        let firstCard = view.subviews[0]
//
//        print("Thisisisiisisis first card",firstCard)
////
////
////
////
//        configureCornerLabel(firstCard, size: CGSize(width: self.view.bounds.width, height: self.view.bounds.height), center: CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY))
//        firstCard.bringSubviewToFront(viewArray[0])
    }
    
    
    
    
    

  

    
    
    
    
//    @objc func handleTap() {
//
//        print("I pressed a view")
//
//
//
//    }
//
//
//    @IBOutlet var cardButton: [UIButton]! {
//        didSet {
//
//            newGame()
//            populateCards(shownCards: shownCards)
//            print(shownCards)
//
//        }
//    }
//
//    //This reveals the hidden cards three at a time.
//    @IBAction func dealThreeButton(_ sender: UIButton) {
//        if hiddenCardCount <= 23 {
//            if deck.cards.count > 0 {
//                for i in hiddenCardCount...hiddenCardCount + 2 {
//
//                    cardButton[i].backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//                    cardButton[i].isHidden = false
//                    cardButton[i].isEnabled = true
//                }
//            }
//
//        } else {
//            print("No more space")
//        }
//        hiddenCardCount += 3
//
//
//    }
//
//    //This is comparing the unique identifier "isChosen" int to compare chosen cards to cards from the deck and if the same, replace them.
//    func populateShownCards(chosenCards: [Card]) {
//        for i in 0..<chosenCards.count {
//            if chosenCards[i].isChosen == shownCards[i].isChosen {
//                shownCards[i] = deck.cards.remove(at: deck.cards.count.arc4random)
//                populateCards(shownCards: [shownCards[i]])
//                populateShownCards(chosenCards: [shownCards[i]])
//            }
//        }
//
//    }
//
//    //TODO This button does not yet work
//    @IBAction func newGameButton(_ sender: UIButton) {
//        shownCards = []
//        deck.clearChosen()
//        newGame()
//    }
//
//
//    //Newgame function which produces 12 shown card buttons with symbols and 12 hidden, non enabled cards. Note that the cards are populated(and 24 total cards removed from deck), but simply inactive and hidden.

    


}
//
//// This an extension that we will use in emoji function so it can stay cleaner and expressinve instead of that long long chain of modifiers.




