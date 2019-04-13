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
    
    
    
    var shownCards = [Card]()
    
    
    
    
    @IBOutlet weak var Setgameview: SetgameView! {
        didSet {
            
        }
    }
    
   
    
    var viewBounds = CGRect()
    
    override func viewDidLoad() {
//        var grid = Grid(layout: Grid.Layout.dimensions(rowCount: 3, columnCount: 4), frame: CGRect(origin: CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY), size: CGSize(width: self.view.bounds.width, height: self.view.bounds.height)))
        
        viewBounds = self.view.bounds
        newGame()
        
    }
    
    
    
    var viewArray = [SetgameView]()
    
    //Create an array of cardViews(Setgameviews)
    private func createCard(cardNum: Int) {
        
        
        let label = SetgameView()
        
        label.shape = shownCards[cardNum].shape.rawValue
        label.color = shownCards[cardNum].color.rawValue
        label.fill = shownCards[cardNum].fill.rawValue
        label.amount = shownCards[cardNum].amount.rawValue
        
        label.tag = cardNum
        
        //TODO I have hooked up a gesture controller to each UIview with borlerplate print command when a Setgame view is clicked.
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
        
        
        label.addGestureRecognizer(tap)
        
        self.view.addSubview(label)
        
        
        
        viewArray.append(label)
        
        
    }
    
    
//    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
//        print("I pressed a card view")
//        if let viewPressed = recognizer.view {
//            print("This is a view pressed", viewPressed, "Tagged Number", viewPressed.tag)
//            viewPressed.layer.borderWidth = 3.0
//            viewPressed.layer.borderColor = UIColor.blue.cgColor
//        } else {
//            print("Something went wrong")
//        }
//
//    }
    
    
    //Configure the Setviewcard and override its layout and position
    private func configureCornerLabel(_ label: UIView, gridNum: Int) {
        var grid = Grid(layout: Grid.Layout.dimensions(rowCount: 3, columnCount: 4), frame: CGRect(origin: CGPoint(x: self.view.bounds.minX, y: self.view.bounds.minY), size: CGSize(width: self.view.bounds.width, height: self.view.bounds.height)))

        label.frame.size = grid[gridNum]?.size ?? self.view.bounds.size
        label.center = CGPoint(x: grid[gridNum]?.midX ?? self.view.bounds.midX, y: grid[gridNum]?.midY ?? self.view.bounds.midY)
//        label.sizeToFit()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        
        
        
        
        
        //Declare a grid. This is a standin as it is static for a 12 view grid
        
        
        //The 0...11 here is just a standin for initially putting twelve cards in the view
        for card in 0..<shownCards.count {
            createCard(cardNum: card)
            configureCornerLabel(viewArray[card], gridNum: card)
        }
        
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
    
    
    
    
    

    var buttonPress = 0

    var hiddenCardCount = 12

    var cardIndex = [Int]()

    @IBAction func cardTouch(_ sender: UIButton) {


//        pickCards(pickedCard: sender)



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
    func newGame() {
        for _ in 0...11 {
            shownCards += [deck.cards.remove(at: deck.cards.count.arc4random)]
        }

        
    }
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
//

    //TODO Need to refine the card selecting logic (Having borders removed after three cards are selected)
    
//The first three cards are selected and stored. Their borders are also colored to show selection.
    @objc func handleTap(_ pickedCard: UIGestureRecognizer) {
        
        if buttonPress <= 2 {
            buttonPress += 1
            if let cardNumber = pickedCard.view {

                cardNumber.layer.borderWidth = 3.0
                cardNumber.layer.borderColor = UIColor.blue.cgColor

                cardIndex += [cardNumber.tag]

                print("cardnumber", cardNumber)

                deck.cardPicking(cardNumber: cardNumber.tag, shownCard: shownCards )


            }


//        //When a 4th card is pressed, the currently selected cards are compared to see whether they are a set. If they are, three new cards are removed from the deck to replace the matches.
        } else if buttonPress == 3 {
            if deck.cardMatching() && deck.cards.count > 0 {

                buttonPress = 0

                print("shown card", cardIndex[1])
                print("cardIndex", cardIndex)
                for i in 0..<cardIndex.count {
                    shownCards[cardIndex[i]] = deck.cards.remove(at: deck.cards.count.arc4random)
                    viewArray[cardIndex[i]].layer.borderWidth = 0
                    
                    
                    
                
                    


                }
                viewArray = []
                
                for i in 0..<shownCards.count {
                    createCard(cardNum: i)
                    configureCornerLabel(viewArray[i], gridNum: i)
                }
                
                cardIndex = []
                deck.clearChosen()


            }
            //If there are no more cards in the deck, hide them.
            else if deck.cardMatching() && deck.cards.count == 0 {
                buttonPress = 0
                for i in 0..<cardIndex.count {
//                    viewArray[cardIndex[i]].isEnabled = false
                    viewArray[cardIndex[i]].isHidden = true
                }
                cardIndex = []
                deck.clearChosen()
            }
//
//            //If the cards do not constitute a set, the borders are removed.
            else {
                buttonPress = 0

                for i in 0..<cardIndex.count {

                    viewArray[cardIndex[i]].layer.borderWidth = 0
                    
                    
                    print("Cardindex hash", viewArray[cardIndex[i]].hash)
                    print("Straight Away", viewArray[0].hash)
                    print("Fifth Array", viewArray[5].hash)
                    
                    
                    
                    

                }
                cardIndex = []
                deck.clearChosen()
            }



        }


    }

}
//
//// This an extension that we will use in emoji function so it can stay cleaner and expressinve instead of that long long chain of modifiers.



extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
