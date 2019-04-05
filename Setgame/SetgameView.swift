//
//  SetgameView.swift
//  Setgame
//
//  Created by Geoffry Gambling on 3/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//

import UIKit

class SetgameView: UIView {
    
    lazy var grid = Grid(layout: Grid.Layout.fixedCellSize(CGSize(width: 20, height: 20)), frame: CGRect(origin: CGPoint(x: bounds.midX, y: bounds.midY), size: CGSize(width: 100, height: 100)))
    
    let deck = SetGameDeck()
    
    
//    private lazy var upperLeftCornerLabel = createCornerLabel()
//
//    private func createCornerLabel() -> UILabel {
//        let label = UILabel()
//        label.numberOfLines = 0
//        addSubview(label)
//
//        return label
//    }
//
//
//
//    private func configureCornerLabel(_ label: UILabel) {
//        label.text = "🐮\n🐮\n🐮\n🐮\n🐮\n🐮\n🐮\n🐮\n🐮\n🐮\n🐮\n🐮"
//
//
//        var shapeRect = CGRect(origin: label.center, size: CGSize.init(width: 50, height: 50))
//
//
//
//
//
//
//        label.frame.size = CGSize.zero
//        label.sizeToFit()
//
//    }
    
    
//    lazy var viewSquare = CGRect(origin: CGPoint(x: bounds.midX, y: bounds.midY), size: CGSize.init(width: 100.0, height: 100.0))
//
//
//
//
//
//    override func layoutSubviews() {
//
//
//        let shapeView = UIView(frame: viewSquare)
//        shapeView.backgroundColor = UIColor.blue
//
//
//
//
//        addSubview(shapeView)
//
//
//
//
//
////        let newView = UIView(frame: path)
////
////
////
////        newView.backgroundColor = UIColor.blue
////        addSubview(newView)
////
//
//
//
//
////        func draw(_rect: CGRect) {
////            let path = UIBezierPath()
////                    path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: bounds.height * 0.10, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
////                    UIColor.red.setFill()
////                    UIColor.black.setStroke()
////                    path.lineWidth = 5.0
////                    path.stroke()
////                    path.fill()
////                    path.move(to: CGPoint(x: bounds.midX, y: bounds.midY / 2))
////        }
//
//        configureCornerLabel(upperLeftCornerLabel)
//
//
//        upperLeftCornerLabel.center = CGPoint(x: bounds.midX, y: bounds.midY)
//        upperLeftCornerLabel.backgroundColor = UIColor.red
//
//    }

    
    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
        
        buidShown()
    
        _ = drawShape(origin: CGPoint(x: bounds.midX, y: bounds.midY), shape: drawOval(amount: "two"), color: UIColor.purple, fill: "shaded")
    
        
        
        
//        _ = drawCircle(origin: CGPoint(x: bounds.midX, y: bounds.midY / 2))
//
//        _ = drawCircle(origin: CGPoint(x: bounds.midX, y: bounds.midY * 1.5))
//
//        _ = drawCircle(origin: CGPoint(x: bounds.midX, y: bounds.midY))
       
        
//        drawOne(origin: bounds)
//        let path = UIBezierPath()
//        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: bounds.height * 0.10, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
//        UIColor.red.setFill()
//        UIColor.black.setStroke()
//        path.lineWidth = 5.0
//        path.stroke()
//        path.fill()
//        path.move(to: CGPoint(x: bounds.midX, y: bounds.midY / 2))
//
//        path.addLine(to: path.currentPoint)
//        path.stroke()
//        path.fill()
//        path.move(to: CGPoint(x: bounds.midX, y: bounds.midY * 1.5))
//        path.stroke()
//        path.fill()
        

//        path.addArc(withCenter: path.currentPoint, radius: bounds.height * 0.10, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
//        path.stroke()
//        path.fill()
//        path.move(to: CGPoint(x: bounds.midX, y: bounds.midY * 1.5))
//
//        path.addArc(withCenter: path.currentPoint, radius: bounds.height * 0.10, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
//        path.stroke()
//        path.fill()
        
//        var shapeRect = CGRect(origin: CGPoint(x: bounds.midX, y: bounds.midY), size: CGSize(width: 100, height: 100))
//
//
//
//
//        var squareView = UILabel(frame: shapeRect)
//
//        squareView.transform = CGAffineTransform.identity.translatedBy(x: -50, y: -50)
//
//        squareView.backgroundColor = UIColor.yellow
//
//        addSubview(squareView)
//
        
        
        
        
    }
    
    
    
    
    //Computed center origin point so it changes when the card size changes
    var originMiddle: CGPoint {
        let point = CGPoint(x: bounds.midX, y: bounds.midY)
        return point
    }
    
    var originTop: CGPoint {
        let point = CGPoint(x: originMiddle.x, y: originMiddle.y / 2)
        return point
    }
    
    var originBottom: CGPoint {
        let point = CGPoint(x: originMiddle.x, y: originMiddle.y * 1.5)
        return point
    }
    
    
    
    //radius of the circle is computed property because I am basing other shape's dimensions off of it. If it was not computed, when card changes size, the other shapes would not resize accordingly.
    var radius: CGFloat {
        let radius = bounds.height * 0.10
        return radius
    }

    
    
    
//    func drawSquare(path: UIBezierPath, originPoint: CGPoint) -> UIBezierPath {
//
//
//
//
//       let path = UIBezierPath(roundedRect: CGRect(origin: path.currentPoint, size: CGSize(width: radius, height: radius)), cornerRadius: 16)
//
//
////        path.addLine(to: CGPoint(x: path.currentPoint.x + radius*2, y: path.currentPoint.y))
////        path.addLine(to: CGPoint(x: path.currentPoint.x, y: path.currentPoint.y - radius))
////        path.addLine(to: CGPoint(x: path.currentPoint.x - radius * 2, y: path.currentPoint.y))
////
////
////        path.close()
//
//        return path
//
//
//    }
    

    
    func drawDiamond(path: UIBezierPath, originPoint: CGPoint) {
        
        
        path.move(to: CGPoint(x: originPoint.x, y: originPoint.y - radius))
        
        path.addLine(to: CGPoint(x: path.currentPoint.x + radius, y: path.currentPoint.y + radius))
        path.addLine(to: CGPoint(x: path.currentPoint.x - radius, y: path.currentPoint.y + radius))
        path.addLine(to: CGPoint(x: path.currentPoint.x - radius, y: path.currentPoint.y - radius))
        
        path.close()
  
    }
    
//    let amountArray = [0,1,2,3]
    
    func drawSquiggle(path: UIBezierPath, originPoint: CGPoint) {
        
        path.move(to: CGPoint(x: originPoint.x - (radius*0.25), y: originPoint.y - (radius*0.25)))
        
        let startPoint = CGPoint(x: path.currentPoint.x + radius / (0.45*CGFloat.pi), y: path.currentPoint.y + radius / (0.45*CGFloat.pi))
        
        let arcCenter = CGPoint(x: path.currentPoint.x, y: path.currentPoint.y)
        
        path.move(to: startPoint)
        
        path.addArc(withCenter: arcCenter, radius: radius, startAngle: 0.25*CGFloat.pi, endAngle: 1.25*CGFloat.pi, clockwise: true)

        path.addLine(to: arcCenter)
      
        path.move(to: startPoint)

        path.addArc(withCenter: path.currentPoint, radius: radius, startAngle: 0.25*CGFloat.pi, endAngle: 1.25*CGFloat.pi, clockwise: false)
        
    }
    
    func drawOval(amount: String) -> UIBezierPath {
        var oval = UIBezierPath()
        let amountName = amount
        switch amountName {
        case "one":
            oval = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: originMiddle.x - radius*1.5, y: originMiddle.y - radius / 2), size: CGSize(width: radius*3, height: radius)), cornerRadius: 100)
        case "two":
            oval = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: originMiddle.x - radius*1.5, y: originMiddle.y + radius), size: CGSize(width: radius*3, height: radius)), cornerRadius: 100)
            
            oval.append(UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: originTop.x - radius*1.5, y: originTop.y + radius), size: CGSize(width: radius*3, height: radius)), cornerRadius: 100))
        case "three":
            oval = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: originMiddle.x - radius*1.5, y: originMiddle.y - radius / 2), size: CGSize(width: radius*3, height: radius)), cornerRadius: 100)
            
            oval.append(UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: originTop.x - radius*1.5, y: originTop.y - radius / 2), size: CGSize(width: radius*3, height: radius)), cornerRadius: 100))
            
            oval.append(UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: originBottom.x - radius*1.5, y: originBottom.y - radius / 2), size: CGSize(width: radius*3, height: radius)), cornerRadius: 100))
            default:
            print("No such amount")
            
            
            
        }
        
        
        
//        let oval = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: originMiddle.x - radius*1.5, y: originMiddle.y - radius / 2), size: CGSize(width: radius*3, height: radius)), cornerRadius: 100)
//
//        oval.append(UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: originTop.x - radius*1.5, y: originTop.y - radius / 2), size: CGSize(width: radius*3, height: radius)), cornerRadius: 100))

        return oval
    }
    
//    var oval: UIBezierPath {
//        var path = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: originMiddle.x - radius*1.5, y: originMiddle.y - radius / 2), size: CGSize(width: radius*3, height: radius)), cornerRadius: 100)
//
//        path = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: originMiddle.x - radius*1.5, y: originMiddle.y - radius / 2), size: CGSize(width: radius*3, height: radius)), cornerRadius: 100)
//
//        return path
//
//    }
    
    func squiggle(amount: String) -> UIBezierPath {
        let squiggle = UIBezierPath()
        
        let amountName: String = amount
        switch amountName {
        case "one":
            drawSquiggle(path: squiggle, originPoint: originMiddle)
        case "two":
            drawSquiggle(path: squiggle, originPoint: CGPoint(x: originTop.x, y: originTop.y + radius))
            drawSquiggle(path: squiggle, originPoint: CGPoint(x: originBottom.x, y: originBottom.y - radius))
        case "three":
            drawSquiggle(path: squiggle, originPoint: originTop)
            drawSquiggle(path: squiggle, originPoint: originMiddle)
            drawSquiggle(path: squiggle, originPoint: originBottom)
        default:
            print("no such amount")
        }

//        drawSquiggle(path: squiggle, originPoint: originTop)
//
//        drawSquiggle(path: squiggle, originPoint: originMiddle)
//
//        drawSquiggle(path: squiggle, originPoint: originBottom)

        
        return squiggle
    }
    
//    let someCharacter: Character = "z"
//    switch someCharacter {
//    case "a":
//    print("The first letter of the alphabet")
//    case "z":
//    print("The last letter of the alphabet")
//    default:
//    print("Some other character")
//    }

    
    
    func diamond(amount: String) -> UIBezierPath {
        let diamond = UIBezierPath()
        
        let amountName: String = amount
        switch amountName {
        case "one":
            drawDiamond(path: diamond, originPoint: originMiddle)
        case "two":
            drawDiamond(path: diamond, originPoint: CGPoint(x: originTop.x, y: originTop.y + radius))
            drawDiamond(path: diamond, originPoint: CGPoint(x: originBottom.x, y: originBottom.y - radius))
        case "three":
            drawDiamond(path: diamond, originPoint: originTop)
            drawDiamond(path: diamond, originPoint: originMiddle)
            drawDiamond(path: diamond, originPoint: originBottom)
        default:
            print("no such amount")
        }
        
//        drawDiamond(path: diamond, originPoint: originTop)
//
//        drawDiamond(path: diamond, originPoint: originMiddle)
//
//        drawDiamond(path: diamond, originPoint: originBottom)
        

        return diamond
    }
    
    
    
    //This is the function to make a shape shaded. It uses the height of the shape to segment.
    
    func addLines(path: UIBezierPath) -> UIBezierPath {
        
        var moreLines: CGFloat = path.bounds.minY
        while moreLines < path.bounds.maxY{

            path.move(to: CGPoint(x: path.bounds.minX, y: moreLines))
            path.addLine(to: CGPoint(x: path.bounds.maxX, y: moreLines))
            moreLines += 10.0
            
            path.stroke()
            
            
        }
        return path
        
    }
    
    
    
        
    func drawShape(origin: CGPoint, shape: UIBezierPath, color: UIColor, fill: String ) -> UIBezierPath {
            let path = shape
        
        
            color.setFill()
            color.setStroke()
            path.lineWidth = 5.0
            path.addClip()
        //        TODO: Adding properties to drawShape. Currently does not compile because of addlines. 
//        addLines(path: path)
//            path.fill()
        
        
//            path.stroke()
            print(shownCards[1].shape.rawValue)
        
        
        if fill == "shaded" {
            return addLines(path: path)
        } else if fill == "clear" {
            path.stroke()
        } else if fill == "filled" {
           path.fill()
        }
        
        
        return path

        
        
        
        
        }
    
        var shownCards = [Card]()
    
    func buidShown() {
        for i in 0...11 {
            shownCards.append(deck.cards[i])
        }
    }
    

    
//        func populateCards(shownCards: [Card]) {
//
//
//
//            for i in 0..<shownCards.count {
////                var btStroke : Int!
//                var btFill = UIBezierPath()
//                var btShape = UIBezierPath()
//                //This data is inherent in the data as text emoji
//
//
//
//                var btColor = UIColor.blue
//
//                if shownCards[i].shape.rawValue == "■" {
//                    btShape = oval
//                } else if shownCards[i].shape.rawValue == "●" {
//                    btShape = squiggle
//                } else if shownCards[i].shape.rawValue == "▲" {
//                    btShape = diamond
//                }
//
//
//
//                if shownCards[i].color.rawValue == "purple" {
//                    btColor = UIColor.purple
//                } else if shownCards[i].color.rawValue == "red" {
//                    btColor = UIColor.red
//                } else if shownCards[i].color.rawValue == "blue" {
//                    btColor = UIColor.blue
//                }
//
//                if shownCards[i].fill.rawValue == "clear" {
//                    btFill = addLines(path: <#T##UIBezierPath#>)
//                } else if shownCards[i].fill.rawValue == "shaded" {
//                    btStroke = -5
//                    btFloat = 0.15
//                } else if shownCards[i].fill.rawValue == "filled" {
//                    btStroke = -5
//                    btFloat = 5.00
//                }
//
//
////                if shownCards[i].amount.rawValue == "two" {
////                    btShape = btShape + btShape
////                } else if shownCards[i].amount.rawValue == "three" {
////                    btShape = btShape + btShape + btShape
////                }
//
//
//            }
//    //        print(deck)
//            print(shownCards.count)
//            print(deck.cards.count)
//        }
    
//    func drawOne(bounds: CGPoint) {
//            _ = drawCircle(origin: CGPoint(x: bounds.midX, y: bounds.midY))
//        }
//
//        func drawTwo() {
//            _ = drawCircle(origin: CGPoint(x: bounds.midX, y: bounds.midY / 2))
//
//            _ = drawCircle(origin: CGPoint(x: bounds.midX, y: bounds.midY * 1.5))
//        }
//
//        func drawThree() {
//            _ = drawCircle(origin: CGPoint(x: bounds.midX, y: bounds.midY / 2))
//
//            _ = drawCircle(origin: CGPoint(x: bounds.midX, y: bounds.midY * 1.5))
//
//            _ = drawCircle(origin: CGPoint(x: bounds.midX, y: bounds.midY))
//
//
//
//
//    }
    

}


