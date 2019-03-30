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
        
        drawShapes()
        
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
    
    func drawShapes() {
        
        func drawCircle(origin: CGPoint) -> UIBezierPath {
            let path = UIBezierPath()
            path.addArc(withCenter: origin, radius: bounds.height * 0.10, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
            UIColor.red.setFill()
            UIColor.black.setStroke()
            path.lineWidth = 5.0
            path.stroke()
            path.fill()
            path.move(to: origin)
            return path
        }
        
        var drawCirc = drawCircle(origin: CGPoint(x: bounds.midX, y: bounds.midY / 1.2))
        
        drawCirc.stroke()
        drawCirc.fill()
        
        drawCirc = drawCircle(origin: CGPoint(x: bounds.midX, y: bounds.midY * 1.3))
        
        drawCirc.stroke()
        drawCirc.fill()
        
        
//        drawCircle(origin: CGPoint(x: bounds.midX, y: bounds.midY / 2), path: UIBezierPath())
//
//        drawCircle(origin: CGPoint(x: bounds.midX, y: bounds.midY * 1.5), path: UIBezierPath())
        
    }
    

}


