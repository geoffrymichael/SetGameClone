//
//  SetgameView.swift
//  Setgame
//
//  Created by Geoffry Gambling on 3/29/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//

import UIKit

class SetgameView: UIView {

    
    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
        
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: bounds.height * 0.10, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        UIColor.red.setFill()
        UIColor.black.setStroke()
        path.lineWidth = 5.0
        path.stroke()
        path.fill()
        path.move(to: CGPoint(x: bounds.midX, y: bounds.midY / 2))
        
        path.addArc(withCenter: path.currentPoint, radius: bounds.height * 0.10, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        path.stroke()
        path.fill()
        path.move(to: CGPoint(x: bounds.midX, y: bounds.midY * 1.5))
        
        path.addArc(withCenter: path.currentPoint, radius: bounds.height * 0.10, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        path.stroke()
        path.fill()
        
        
        
        
        
    }
    

}
