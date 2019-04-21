//
//  playingCardView.swift
//  Setgame
//
//  Created by Geoffry Gambling on 4/14/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//

import UIKit

class playingCardView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    var deck = SetGameDeck()
    
    
    
    var shownCards = [Card]()
    
    
    var buttonPress = 0
    
    var hiddenCardCount = 12
    
    var cardIndex = [Int]()
    
    var score = 0 {
        didSet {
            layoutSubviews()
        }
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
        
        label.backgroundColor = UIColor.clear
        label.contentMode = .redraw
        
        //TODO I have hooked up a gesture controller to each UIview with borlerplate print command when a Setgame view is clicked.
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
        
        
        label.addGestureRecognizer(tap)
        
        addSubview(label)
        
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
        
        let phoneFrame = bounds
        
//        let phoneOffsets = UIEdgeInsets(top: 50, left: 30, bottom: phoneFrame.height * 0.25, right: 30)
//
//        phoneFrame = phoneFrame.inset(by: phoneOffsets)
        
        var rows = 0
        var columns = 0
        
        while rows * columns <= shownCards.count {
            while columns <= 3 {
                columns += 1
            }
            
            rows += 1
        }
        
        
        
        let grid = Grid(layout: Grid.Layout.dimensions(rowCount: rows, columnCount: columns), frame: CGRect(origin: CGPoint(x: phoneFrame.minX, y: phoneFrame.minY), size: CGSize(width: phoneFrame.width, height: phoneFrame.height)))
        
        
        
        label.frame.size = grid[gridNum]?.insetBy(dx: 5, dy: 5).size ?? bounds.size
        label.center = CGPoint(x: grid[gridNum]?.midX ?? bounds.midX, y: grid[gridNum]?.midY ?? bounds.midY)
        
        //        label.sizeToFit()
        
        
    }
    
    override func layoutSubviews() {
    
        
        print("I am pressed")
        
        
        
        //Declare a grid. This is a standin as it is static for a 12 view grid
        
        
        //The 0...11 here is just a standin for initially putting twelve cards in the view
        
        for card in 0..<shownCards.count {
            
            configureCornerLabel(viewArray[card], gridNum: card)
        }
        
        
       
    }
    
    
    
    
    
    
    
    
   
    
    
    
    
    
    //    //Newgame function which produces 12 shown card buttons with symbols and 12 hidden, non enabled cards. Note that the cards are populated(and 24 total cards removed from deck), but simply inactive and hidden.
    func newGame() {
        for card in 0...11 {
            shownCards += [deck.cards.remove(at: deck.cards.count.arc4random)]
            createCard(cardNum: card)
        }
        
        
    }
    
    
    //TODO Need to refine the card selecting logic (Having borders removed after three cards are selected)
    
    //The first three cards are selected and stored. Their borders are also colored to show selection.
    
    
    func drawThree() {
        
        for _ in 0...3 {
            if deck.cards.count > 0 {
                shownCards.append(deck.cards.remove(at: deck.cards.count.arc4random))
                createCard(cardNum: shownCards.endIndex - 1)

            }
            
//            createCard(cardNum: shownCards.endIndex - 1)
        }
        for i in 0..<shownCards.count {
            
            configureCornerLabel(viewArray[i], gridNum: i)
        }
        
        
    }
    
    @objc func handleTap(_ pickedCard: UIGestureRecognizer) {
        
        
        print(score)
        
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
                score += 1
                
                print("shown card", cardIndex[1])
                print("cardIndex", cardIndex)
                for i in 0..<cardIndex.count {
                    shownCards[cardIndex[i]] = deck.cards.remove(at: deck.cards.count.arc4random)
                    viewArray[cardIndex[i]].layer.borderWidth = 0
                    
                    createCard(cardNum: cardIndex[i])
                    viewArray[cardIndex[i]].removeFromSuperview()
                    viewArray[cardIndex[i]] = viewArray.remove(at: viewArray.endIndex - 1)
                    
                    
                    
                    
                    
                }
                
                
//                for i in 0..<viewArray.count {
//                    viewArray[i].removeFromSuperview()
//                }
                
//                viewArray = []
                
//                for i in 0..<shownCards.count {
//                    self.layoutSubviews()
//                }
                
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
