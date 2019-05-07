//
//  playingCardView.swift
//  Setgame
//
//  Created by Geoffry Gambling on 4/14/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//

import UIKit

//A protocol that allows this view to affect our ViewController. In this case I need it to be able to update the UILabel text that is an IBOutlet of the ViewController. Also make sure to declare a delegate and then call the delgate where we want it happen on this view.
protocol changeLabelDelegate: class {
    func scoreChanged(score: Int)
}

class playingCardView: UIView {

    
    
    //Declaring the protocol delegate
    weak var delegate: changeLabelDelegate? = nil

    
    var deck = SetGameDeck()

    var shownCards = [Card]()

       
    //Tracking which card has been selected
    var cardIndex = [Int]()
    
    //A basic score count that += to 1 if a match occurs. For now the visual display of this is done through a protocol because the programs score and draw buttons are seperate from this playingCardView. Not sure if this is best practice or not.
    var score = 0 {
        didSet {
            layoutSubviews()
        }
    }
    
    //Storing card views in an array. These are the visual representations of the cards currently on the board.
    var viewArray = [SetgameView]()
    
    
    //The animation delay that will be += through the interation to stutter the animation for each card so it delineates each card being dealt visually.
    private var delay = 0.5
    
    
    //This is the grid framework. It is a computed property theat uses playingCardView as the bounds. It dynamically adjust for rows and columns depending on amount of cards currently in view.
    var grid: Grid {
        let phoneFrame = self.bounds
        
        var rows = 0
        var columns = 0
        
        //This establishes rows of no more than three cards. This is more a stylistic choice and can be altered as desired.
        while rows * columns <= shownCards.count {
            while columns <= 3 {
                columns += 1
            }
            
            rows += 1
        }
        
        //Setting up the grid dimensions.
        let grid = Grid(layout: Grid.Layout.dimensions(rowCount: rows, columnCount: columns), frame: CGRect(origin: CGPoint(x: phoneFrame.minX, y: phoneFrame.minY), size: CGSize(width: phoneFrame.width, height: phoneFrame.height)))
        
        return grid
    }
    
    
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
        
        
        //decalring  a tap gesture to each of our cards views.
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
        //Adding the gesture to each card.
        label.addGestureRecognizer(tap)
        
        //Adding the card view as a subview of playingCardView
        addSubview(label)
        
        //Adding each card view to an array. This will represent what cards are currently on the table.
        viewArray.append(label)

        
    }
    

    
    //Configure the Setviewcard and override its layout and position
    private func configureCard(_ label: UIView, gridNum: Int) {
        
        
        //Currently this is used to establish a basic layout for the cards in the grid and have them redraw when views are laidout. This actiona is also animated. The initial twelve cards being dealt are in the newGame function and impliment annimation that starts from bottom left of the view and animates as they move into place in the grid.
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, animations: { label.frame.size = self.grid[gridNum]?.insetBy(dx: 5, dy: 5).size ?? self.bounds.size; label.center = CGPoint(x: self.grid[gridNum]?.midX ?? self.bounds.midX, y: self.grid[gridNum]?.midY ?? self.bounds.midY) } )
        

        
    }
    
    override func layoutSubviews() {
    
        //Just for debugging and tracking when subviews are laid out
        print("I am pressed")
        
        for card in 0..<shownCards.count {
            
            configureCard(viewArray[card], gridNum: card)
        }
        
        
       
    }
    
    
    
    //    //Newgame function which produces 12 shown card view buttons with symbols. These card subviews animate from the lower left corner into their respective places in the grid.
    func newGame() {
        
        
        for card in 0...11 {
            shownCards += [deck.cards.remove(at: deck.cards.count.arc4random)]
            createCard(cardNum: card)
            
        }
        
     
        viewArray.forEach { view in
            drawAnimation(view: view)

        }
        delay = 0.5
     
    }
    
    func drawAnimation(view: SetgameView) {
        var card = 0
        //This sets the initial card origin at the bottom left of the board and animates them being dealt into their grid positions.
        view.center = CGPoint(x: self.bounds.minX, y: self.bounds.maxY)
        
        //Here is where the cards are animated to in the grid
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0, delay: delay, animations: { view.frame.size = self.grid[card]?.insetBy(dx: 5, dy: 5).size ?? self.bounds.size
            view.center = CGPoint(x: self.grid[card]?.midX ?? self.bounds.midX, y: self.grid[card]?.midY ?? self.bounds.midY) }, completion: { finisehd in
                UIView.transition(with: view, duration: 1.0, options: [.transitionFlipFromLeft], animations: { view.isChosen = true })
        })
        card += 1
        //The animation delay that will be += through the interation to stutter the animation for each card so it delineates each card being dealt visually.
        delay += 0.5
    }
    
    
    
    //A function to draw three new cards from the deck and put them into our shownCards data array as well as visually representing on the board.
    func drawThree() {
        
        for _ in 0...2 {
            if deck.cards.count > 0 {
                //Adding three cards to the dataset by removing them from the deck
                shownCards.append(deck.cards.remove(at: deck.cards.count.arc4random))
                //Creating the visual representation of our card from the data.
                createCard(cardNum: shownCards.endIndex - 1)
                drawAnimation(view: viewArray[viewArray.endIndex - 1])
            }
            
            

        }
        
        delay = 0.5
        
        
    }
    
    
    //This is what happens when a card is pressed. Currently, visually the card gets a blue border and its data is added into an array so that the cards can be matched against each other according to the logic laid out in the SetGameDeck.
    @objc func handleTap(_ pickedCard: UIGestureRecognizer) {
   
        
        
        if deck.chosenCards.count <= 2 {
            
            if let cardSelectedView = pickedCard.view {
                
                cardIndex += [cardSelectedView.tag]
                
                var cardData = shownCards[cardSelectedView.tag]
                cardData.isChosen = true
                
                cardSelectedView.layer.borderWidth = 3.0
                cardSelectedView.layer.borderColor = UIColor.blue.cgColor
                
                
                
                print("cardnumber", cardSelectedView)

                
                deck.cardPicking(selectedCard: cardData)
                
                
            }
            
            
            //        //When a 4th card is pressed, the currently selected cards are compared to see whether they are a set. If they are, three new cards are removed from the deck to replace the matches.
        } else if deck.chosenCards.count == 3 {
            if deck.cardMatching() && deck.cards.count > 0 {
                
                
                score += 1
                
                //I believe that this triggers the delegate function to trigger in view controller to update viewcontrollers score label uilabel with the current score.
                delegate?.scoreChanged(score: score)
                
                print("shown card", cardIndex[1])
                print("cardIndex", cardIndex)
                
                //TODO: This is a placeholder for animating matched cards being replaced by new cards from the deck. Currently, the chosen cards fade out to alpha 0 then the new cards come in with alpha zero and animates into alpha 1. I imagine I need to clean up some stuff because possibly alpha doesnt do the same job of removing from the superview I don't think. Also must make sure to handle when the deck runs out of cards. 
                
                
                for i in 0..<cardIndex.count {
                    if deck.cards.count > 0 {
                        
                    
                    shownCards[cardIndex[i]] = deck.cards.remove(at: deck.cards.count.arc4random)
                    viewArray[cardIndex[i]].layer.borderWidth = 0
                    
                    createCard(cardNum: cardIndex[i])
                    
                    UIViewPropertyAnimator.runningPropertyAnimator(
                        withDuration: 1.0,
                        delay: 0.0, options:
                        [.transitionFlipFromLeft],
                        animations: {self.viewArray[self.cardIndex[i]].alpha = 0 })
                    
                    viewArray[cardIndex[i]] = viewArray.remove(at: viewArray.endIndex - 1)
                    viewArray[cardIndex[i]].alpha = 0
                        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0, delay: 1.0, options: [.transitionFlipFromLeft], animations: { self.viewArray[self.cardIndex[i]].alpha = 1; self.viewArray[self.cardIndex[i]].isChosen = true })
                    
                    }
                    
                    
                    
                }
                
                
      
                //Clearing the arrays the keep track of selected cards
                cardIndex = []
                deck.clearChosen()
                
                
            }
                //If there are no more cards in the deck, hide them.
            else if deck.cardMatching() && deck.cards.count == 0 {
                
                for i in 0..<cardIndex.count {
                    //                    viewArray[cardIndex[i]].isEnabled = false
                    viewArray[cardIndex[i]].isHidden = true
                }
                cardIndex = []
                deck.clearChosen()
            }
                
                //If the cards do not constitute a set, the borders are removed.
            else {
                
                
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

//An extension that is used to draw four cards at random from our card array data set.
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
