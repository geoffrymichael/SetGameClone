//
//  SetgameView.swift
//  Setgame
//
//  Created by Geoffry Gambling on 3/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//

import UIKit

class SetgameView: UIView {
    
    
    
    @IBInspectable
    var shape: String = "squiggle" { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable
    var color: String = "red" { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable
    var fill: String = "shaded" { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable
    var amount: String = "three" { didSet { setNeedsDisplay(); setNeedsLayout() } }
    
   
    
    override func draw(_ rect: CGRect) {
        
        //TODO this is programatically making setgame background view transparent but it will not load on startup. Need to bug test.
        self.backgroundColor = UIColor.clear
        self.isOpaque = true
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16)
        roundedRect.addClip()
        UIColor.gray.setFill()
        roundedRect.fill()
        
        
        
        
        
    
        _ = drawShape(origin: CGPoint(x: bounds.midX, y: bounds.midY), shape: shape, color: color, fill: fill, amount: amount)

        
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

    
    
    
  

    
    func drawDiamond(path: UIBezierPath, originPoint: CGPoint) {
        
        
        path.move(to: CGPoint(x: originPoint.x, y: originPoint.y - radius))
        
        path.addLine(to: CGPoint(x: path.currentPoint.x + radius, y: path.currentPoint.y + radius))
        path.addLine(to: CGPoint(x: path.currentPoint.x - radius, y: path.currentPoint.y + radius))
        path.addLine(to: CGPoint(x: path.currentPoint.x - radius, y: path.currentPoint.y - radius))
        
        path.close()
  
    }
    

    
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
    
    func oval(amount: String) -> UIBezierPath {
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

        return oval
    }

    
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

       
        return squiggle
    }
    


    
    
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
        

        return diamond
    }
    
    
    
    //This is the function to make a shape shaded. It uses the height of the shape to segment.
    func addLines(path: UIBezierPath)  {
        
        var moreLines: CGFloat = path.bounds.minY
        while moreLines < path.bounds.maxY{

            path.move(to: CGPoint(x: path.bounds.minX, y: moreLines))
            path.addLine(to: CGPoint(x: path.bounds.maxX, y: moreLines))
            moreLines += 10.0
            
            path.stroke()
            
            
        }
        
        
    }
    
    
    
        
    func drawShape(origin: CGPoint, shape: String, color: String, fill: String, amount: String ) -> UIBezierPath {
        
        
        var path = UIBezierPath()
        var shapeColor = UIColor()
        
        
        let pathName: String = shape
        switch pathName {
        case "diamond":
            path = diamond(amount: amount)
        case "oval":
            path = oval(amount: amount)
        case "squiggle":
            path = squiggle(amount: amount)
        default:
            path = diamond(amount: amount)
        }
        
        print(path)
        print(shape)
        

        let colorName: String = color
        switch colorName {
        case "green":
            shapeColor = UIColor.green
        case "red":
            shapeColor = UIColor.red
        case "purple":
            shapeColor = UIColor.purple
        default:
            shapeColor = UIColor.yellow
        }
        
            shapeColor.setFill()
            shapeColor.setStroke()
            path.lineWidth = 5.0
            path.addClip()
        
        let fillName: String = fill
        switch fillName {
        case "clear":
            path.stroke()
        case "shaded":
            addLines(path: path)
        case "filled":
            path.fill()
            path.stroke()
        default:
            path.stroke()
            
        }

        
        return path

        
        }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay()
        setNeedsLayout()
    }

    
    

}


