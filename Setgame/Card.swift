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

struct Card {
    
       
    var shape: Shape
    var color: Color
    var fill: Fill
    var amount: Amount
    
    
    enum Shape: String, CustomStringConvertible {
        case triangle = "▲"
        case square = "■"
        case circle = "⚫︎"
        
        static var all = [Shape.triangle, .square, .circle]
        
        var description: String { return rawValue }
    }
    
    enum Color: String , CustomStringConvertible {
        var description: String {return rawValue}
        
        
        
        case blue = "blue"
        case red = "red"
        case purple = "purple"
        
        static var all = [Color.blue, .red, .purple]
        
        
        
    }
    
    enum Fill: String, CustomStringConvertible {
        var description: String {return rawValue}
        
        case clear = "clear"
        case shaded = "shaded"
        case filled = "filled"
        
        static var all = [Fill.clear, .shaded, .filled ]
        
    }
    
    enum Amount: Int {
        
        
        case one = 1
        case two = 2
        case three = 3
        
        static var all = [Amount.one, .two, .three]
        
        
    }
    
    
    
}
