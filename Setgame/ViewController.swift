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
    
    var backgroundView = SetBackgroundView()
    
    @IBOutlet weak var SetgameView: SetgameView! {
        didSet {
            SetgameView.amount = "one"
            
            var grid = Grid(layout: Grid.Layout.dimensions(rowCount: 5, columnCount: 5), frame: CGRect(origin: CGPoint(x: backgroundView.bounds.minX, y: backgroundView.bounds.minY), size: CGSize(width: backgroundView.bounds.width, height: backgroundView.bounds.height)))
            
            SetgameView.updateConstraints()
            
            SetgameView.bounds.origin = CGPoint(x: grid[0]?.midX ?? backgroundView.bounds.midX, y: grid[0]?.midX ?? backgroundView.bounds.midY)
            
            
            
        }
    }
    
//    var shownCards = [Card]()
//
//    var buttonPress = 0
//
//    var hiddenCardCount = 12
//
//    var cardIndex = [Int]()
//
//    @IBAction func cardTouch(_ sender: UIButton) {
//
//
//        pickCards(pickedCard: sender)
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
//    func newGame() {
//        for _ in 0..<cardButton.count {
//            shownCards += [deck.cards.remove(at: deck.cards.count.arc4random)]
//        }
//
//        for i in 12...23 {
//
//            cardButton[i].isEnabled = false
//            cardButton[i].isHidden = true
//
//
//        }
//    }
//
//
//    // Iterates through the first 24 cards and reads thier attributes and then shows them via the changeAtt function.
//    func populateCards(shownCards: [Card]) {
////       var x = 0
//
//
//        for i in 0..<shownCards.count {
//            var btStroke : Int!
//            var btFloat : Float!
//            //This data is inherent in the data as text emoji
//            var btShape = shownCards[i].shape.rawValue
//
//
//            var btColor = UIColor.blue
//
//
//
//            if shownCards[i].color.rawValue == "purple" {
//                btColor = UIColor.purple
//            } else if shownCards[i].color.rawValue == "red" {
//                btColor = UIColor.red
//            } else if shownCards[i].fill.rawValue == "blue" {
//                btColor = UIColor.blue
//            }
//
//            if shownCards[i].fill.rawValue == "clear" {
//                btStroke = 5
//                btFloat = 5.00
//            } else if shownCards[i].fill.rawValue == "shaded" {
//                btStroke = -5
//                btFloat = 0.15
//            } else if shownCards[i].fill.rawValue == "filled" {
//                btStroke = -5
//                btFloat = 5.00
//            }
//
//
//            if shownCards[i].amount.rawValue == "two" {
//                btShape = btShape + btShape
//            } else if shownCards[i].amount.rawValue == "three" {
//                btShape = btShape + btShape + btShape
//            }
//
//            changeAtt(btShape, place: i, btStroke: btStroke, btFloat: btFloat, btColor: btColor)
//
////            x += 1
//        }
////        print(deck)
//        print(shownCards.count)
//        print(deck.cards.count)
//    }
//
//    //This is the visual function of the game. When used in populateCards it will translate the attirbute data into its visual representation.
//    func changeAtt(_ text: String, place: Int, btStroke: Int, btFloat: Float, btColor: UIColor) {
//        var textColor: [NSAttributedString.Key: Any] = [
//                    .strokeWidth : btStroke,
//                    .strokeColor : btColor,
//                    .foregroundColor : btColor.withAlphaComponent(CGFloat(btFloat)),
//                    .font : UIFont.systemFont(ofSize : 25)
//                ]
//
//                let textAttributes = NSAttributedString(string: text, attributes: textColor)
//                cardButton[place].setAttributedTitle(textAttributes, for: [])
//
//            }
//
//
//
//
//
//
//    //The first three cards are selected and stored. Their borders are also colored to show selection.
//    func pickCards( pickedCard: UIButton) {
//        if buttonPress <= 2 {
//            buttonPress += 1
//            if let cardNumber = cardButton.index(of: pickedCard) {
//
//                cardButton[cardNumber].layer.borderWidth = 3.0
//                cardButton[cardNumber].layer.borderColor = UIColor.blue.cgColor
//
//                cardIndex += [cardNumber]
//
//                print("cardnumber", cardNumber)
//
//                deck.cardPicking(cardNumber: cardNumber, shownCard: shownCards )
//
//
//            }
//
//
//        //When a 4th card is pressed, the currently selected cards are compared to see whether they are a set. If they are, three new cards are removed from the deck to replace the matches.
//        } else if buttonPress == 3 {
//            if deck.cardMatching() && deck.cards.count > 0 {
//
//                buttonPress = 0
//
//                print("shown card", cardIndex[1])
//                print("cardIndex", cardIndex)
//                for i in 0..<cardIndex.count {
//                    shownCards[cardIndex[i]] = deck.cards.remove(at: deck.cards.count.arc4random)
//                    cardButton[cardIndex[i]].layer.borderWidth = 0
//                    populateCards(shownCards: shownCards)
//
//
//                }
//                cardIndex = []
//                deck.clearChosen()
//
//
//            }
//            //If there are no more cards in the deck, hide them.
//            else if deck.cardMatching() && deck.cards.count == 0 {
//                buttonPress = 0
//                for i in 0..<cardIndex.count {
//                    cardButton[cardIndex[i]].isEnabled = false
//                    cardButton[cardIndex[i]].isHidden = true
//                }
//                cardIndex = []
//                deck.clearChosen()
//            }
//
//            //If the cards do not constitute a set, the borders are removed.
//            else {
//                buttonPress = 0
//
//                for i in 0..<cardIndex.count {
//
//                    cardButton[cardIndex[i]].layer.borderWidth = 0
//
//                }
//                cardIndex = []
//                deck.clearChosen()
//            }
//
//
//
//        }
//
//
//    }
//
//}
//
//// This an extension that we will use in emoji function so it can stay cleaner and expressinve instead of that long long chain of modifiers.
//extension Int {
//    var arc4random: Int {
//        if self > 0 {
//            return Int(arc4random_uniform(UInt32(self)))
//        } else if self < 0 {
//            return -Int(arc4random_uniform(UInt32(abs(self))))
//        } else {
//            return 0
//        }
//    }
}


