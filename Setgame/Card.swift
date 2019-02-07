//
//  Card.swift
//  Setgame
//
//  Created by Geoffry Gambling on 2/1/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//

import Foundation

struct Card {
    var shape : Int
    var color : Int
    var fill : Int
    var amount : Int
    var cardDict: [String: Int] {
        return ["shape": shape,
                "color:": color,
                "fill": fill,
                "amount": amount
        ]
    }
    var nsDictionary: NSDictionary {
        return cardDict as NSDictionary
    }
}

