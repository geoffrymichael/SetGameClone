//
//  ViewController.swift
//  Setgame
//
//  Created by Geoffry Gambling on 1/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//



//TODO: The basic population of the decks seems to be working. Next is the logic of picking and comparing cards


import UIKit

class ViewController: UIViewController {

    var deck = SetGameDeck()
    
    var chosenCards = [Card]()
    
    var firstCard = [String]()
    var secondCard = [String]()
    var thirdCard = [String]()
    
    var matchCount = 0
    var matchCard = [String]()
    
    //    TODO: Able to clear the chosenCards array and clear borders when clicking on third card. This woud be used when the cards dont match set conditions. Need to figure out set conditions.
    @IBAction func cardTouch(_ sender: UIButton) {
        
        
            pickCards(pickedCard: sender)
            
        
        
        
    }

    
    @IBOutlet var cardButton: [UIButton]! {
        didSet {
            
            populateCards()
            
            
        }
    }
    
    
    func populateCards() {
       var x = 0
        
        
        for _ in cardButton{
            var btStroke : Int!
            var btFloat : Float!
            var btShape = deck.cards[x].shape.rawValue
            
            
            var btColor = UIColor.blue
            
            
            if deck.cards[x].color.rawValue == "purple" {
                btColor = UIColor.purple
            } else if deck.cards[x].color.rawValue == "red" {
                btColor = UIColor.red
            } else if deck.cards[x].fill.rawValue == "blue" {
                btColor = UIColor.blue
            }
            
            if deck.cards[x].fill.rawValue == "clear" {
                btStroke = 5
                btFloat = 5.00
            } else if deck.cards[x].fill.rawValue == "shaded" {
                btStroke = -5
                btFloat = 0.15
            } else if deck.cards[x].fill.rawValue == "filled" {
                btStroke = -5
                btFloat = 5.00
            }
            
            
            
            
            if deck.cards[x].amount.rawValue == "two" {
                btShape = btShape + btShape
            } else if deck.cards[x].amount.rawValue == "three" {
                btShape = btShape + btShape + btShape
            }
            
            changeAtt(btShape, place: x, btStroke: btStroke, btFloat: btFloat, btColor: btColor)
            
            x += 1
        }
        
    }
    
    
    func changeAtt(_ text: String, place: Int, btStroke: Int, btFloat: Float, btColor: UIColor) {
        var textColor: [NSAttributedString.Key: Any] = [
                    .strokeWidth : btStroke,
                    .strokeColor : btColor,
                    .foregroundColor : btColor.withAlphaComponent(CGFloat(btFloat)),
                    .font : UIFont.systemFont(ofSize : 25)
            
        
                ]
        
                let textAttributes = NSAttributedString(string: text, attributes: textColor)
                cardButton[place].setAttributedTitle(textAttributes, for: [])
        
            }
    
    func clearChosen() {
        var x = 0
        for i in cardButton {
            cardButton[x].layer.borderWidth = 0
            x += 1
        }
        for i in 0...chosenCards.count {
            
            if firstCard.contains(secondCard[i]) {
                matchCount += 1
                matchCard += [secondCard[i]]
                print("this is how many matches we have now", matchCount, matchCard)
                
                
            }
            
        }
        
        if matchCount == 0 {
            for i in 0...3 {
                if secondCard.contains(thirdCard[i]) {
                    print("no match first two cards")
                    break
                }
                    
             }
                print("No match for all different")
        } else if matchCount == 1 {
            matchCount = 0
            for i in 0...3 {
                //TODO  Need to figure out the logic for three cards with only one match attribute. Right now the logic below isnt working resulting in a win with more than one matching attribute.
                if secondCard.contains(thirdCard[i]) {
                    matchCount += 1
                    if matchCount == 1 {
                        print("This is a one match over three cards")
                        break
                    }
                } else {
                    print("No match of one over three cardfs")
                }
            }
        }
        
        chosenCards = []
        matchCount = 0
        matchCard = []
        print(chosenCards)
        print(chosenCards.count)
    }
    
    func pickCards( pickedCard: UIButton) {
        
            if let cardNumber = cardButton.index(of: pickedCard) {
                
                cardButton[cardNumber].layer.borderWidth = 3.0
                cardButton[cardNumber].layer.borderColor = UIColor.blue.cgColor
                
                chosenCards.append(deck.cards[cardNumber])
                
                if chosenCards.count == 1 {
                    firstCard = [chosenCards[0].shape.rawValue, chosenCards[0].color.rawValue, chosenCards[0].fill.rawValue, chosenCards[0].amount.rawValue]
                    print(firstCard, "asdfasdfasdfasdfasdf")
                } else if chosenCards.count == 2 {
                    secondCard = [chosenCards[1].shape.rawValue, chosenCards[1].color.rawValue, chosenCards[1].fill.rawValue, chosenCards[1].amount.rawValue]
                    print(secondCard, "this is the second card")
                } else if chosenCards.count == 3  {
                    thirdCard = [chosenCards[2].shape.rawValue, chosenCards[2].color.rawValue, chosenCards[2].fill.rawValue, chosenCards[2].amount.rawValue]
                    print("this is the third card", thirdCard)
                    
                    clearChosen()
                    
                    
                    
                }
                    
                
                
                
                
            }
            
        
    }
    
}




