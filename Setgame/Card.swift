//
//  Card.swift
//  Setgame
//
//  Created by Geoffry Gambling on 2/1/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//

import Foundation

//struct Card {
//    var shape : Int
//    var color : Int
//    var fill : Int
//    var amount : Int
//    var cardDict: [String: Int] {
//        return ["shape": shape,
//                "color:": color,
//                "fill": fill,
//                "amount": amount
//        ]
//    }
//    var nsDictionary: NSDictionary {
//        return cardDict as NSDictionary
//    }
//}

struct Card: Equatable {
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.shape == rhs.shape &&
        lhs.color == rhs.color &&
        lhs.fill == rhs.fill
    }
    
    var shape: Shape
    var color: Color
    var fill: Fill
    var amount: Amount
    var uniqueIdentifier: Int
    var isChosen: Bool
    
    
    enum Shape: String, Equatable, CustomStringConvertible {
        case diamond = "diamond"
        case oval = "oval"
        case squiggle = "squiggle"
        
        static var all = [Shape.diamond, .oval, .squiggle]
        
        var description: String { return rawValue }
        
        static func == (lhs: Card.Shape, rhs: Card.Shape) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }
    }
    
    enum Color: String , Equatable, CustomStringConvertible {
        var description: String {return rawValue}
        
        
        
        case green = "green"
        case red = "red"
        case purple = "purple"
        
        static var all = [Color.green, .red, .purple]
        
        static func == (lhs: Card.Color, rhs: Card.Color) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }
        
    }
    
    enum Fill: String, Equatable, CustomStringConvertible {
        var description: String {return rawValue}
        
        case clear = "clear"
        case shaded = "shaded"
        case filled = "filled"
        
        static var all = [Fill.clear, .shaded, .filled ]
        
        
        static func == (lhs: Card.Fill, rhs: Card.Fill) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }
        
    }
    
    enum Amount: String, Equatable, CustomStringConvertible {
        
        var description: String { return rawValue }
        
        case one = "one"
        case two = "two"
        case three = "three"
        
        static var all = [Amount.one, .two, .three]
        
        static func == (lhs: Card.Amount, rhs: Card.Amount) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }
        
    }
    
    
    
}
