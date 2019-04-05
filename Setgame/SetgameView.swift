//
//  SetgameView.swift
//  Setgame
//
//  Created by Geoffry Gambling on 3/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//

import UIKit

class SetgameView: UIView {
    
    
    
    
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
        
       
        
        _ = drawShape(origin: CGPoint(x: bounds.midX, y: bounds.midY / 2), shape: squiggle)
        
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
    
    var oval: UIBezierPath {
        let path = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: originMiddle.x - radius*1.5, y: originMiddle.y - radius / 2), size: CGSize(width: radius*3, height: radius)), cornerRadius: 100)

        return path
        
    }
    
    var squiggle: UIBezierPath {
        let path = UIBezierPath()
        
        

        drawSquiggle(path: path, originPoint: originTop)

        drawSquiggle(path: path, originPoint: originMiddle)
        
        drawSquiggle(path: path, originPoint: originBottom)

        
        return path
    }
    
    var diamond: UIBezierPath {
        let path = UIBezierPath()
        
       
        drawDiamond(path: path, originPoint: originTop)
        addLines(path: path)
        drawDiamond(path: path, originPoint: originMiddle)
        addLines(path: path)
        drawDiamond(path: path, originPoint: originBottom)
        addLines(path: path)

        return path
    }
    
    
    
    //This is the function to make a shape shaded. It uses the height of the shape to segment.
    func addLines(path: UIBezierPath) {
        var moreLines: CGFloat = path.bounds.minY
        while moreLines < path.bounds.maxY{
            
            path.move(to: CGPoint(x: path.bounds.minX, y: moreLines))
            path.addLine(to: CGPoint(x: path.bounds.maxX, y: moreLines))
            moreLines += 10.0
            print(moreLines)
        }
        
    }
    
    
        
    func drawShape(origin: CGPoint, shape: UIBezierPath) -> UIBezierPath {
            let path = shape
        
        
            UIColor.red.setFill()
            UIColor.red.setStroke()
            path.lineWidth = 5.0
            path.addClip()
            addLines(path: path)
            path.stroke()
        

        
            return path
        
        
        }
        
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


