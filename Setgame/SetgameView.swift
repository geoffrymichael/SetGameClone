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
        
       
        
        _ = drawCircle(origin: CGPoint(x: bounds.midX, y: bounds.midY / 2), shape: circle)
        
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
    var centerPoint: CGPoint {
        let point = CGPoint(x: bounds.midX, y: bounds.midY)
        return point
    }
    
    
    //Computed, middle, top, and bottom origin point properties
    var originMiddle: CGPoint {
        let point = centerPoint
        return point
    }
    
    var originTop: CGPoint {
        let point = CGPoint(x: centerPoint.x, y: centerPoint.y / 2)
        return point
    }
    
    var originBottom: CGPoint {
        let point = CGPoint(x: centerPoint.x, y: centerPoint.y * 1.5)
        return point
    }
    
    //radius of the circle is computed property because I am basing other shape's dimensions off of it. If it was not computed, when card changes size, the other shapes would not resize accordingly.
    var radius: CGFloat {
        let radius = bounds.height * 0.10
        return radius
    }

    
    
    func drawTriangle(path: UIBezierPath, originPoint: CGPoint) {
        
        path.move(to: CGPoint(x: originPoint.x, y: originPoint.y - radius))
        
        path.addLine(to: CGPoint(x: path.currentPoint.x + radius, y: path.currentPoint.y + radius*2))
        path.addLine(to: CGPoint(x: path.currentPoint.x - radius*2, y: path.currentPoint.y))
        
        path.close()
  
    }
    
//    let amountArray = [0,1,2,3]
    
    func drawCircle(path: UIBezierPath, originPoint: CGPoint ) {

        path.addArc(withCenter: originPoint, radius: radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
   
        
    }
    
    var circle: UIBezierPath {
        let path = UIBezierPath()
        
        drawCircle(path: path, originPoint: originTop)
        path.move(to: centerPoint)
        drawCircle(path: path, originPoint: originMiddle)
        path.move(to: originBottom)
        drawCircle(path: path, originPoint: originBottom)
        
        return path
    }
    
    var triangle: UIBezierPath {
        let path = UIBezierPath()
        
       
        drawTriangle(path: path, originPoint: originTop)
        drawTriangle(path: path, originPoint: originMiddle)
        drawTriangle(path: path, originPoint: originBottom)

        return path
    }
    
  
        
    func drawCircle(origin: CGPoint, shape: UIBezierPath) -> UIBezierPath {
            let path = shape
        
        
            UIColor.red.setFill()
            UIColor.black.setStroke()
            path.lineWidth = 5.0
            path.stroke()
            path.fill()
        
        
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


