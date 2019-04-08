//
//  SetBackgroundView.swift
//  Setgame
//
//  Created by Geoffry Gambling on 4/8/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//

import UIKit

class SetBackgroundView: UIView {

    
    private lazy var cardOne = createCard()
    private lazy var cardTwo = createCard()
    
    private func createCard() -> UIView {
        let label = SetgameView()
        
        addSubview(label)
        
        return label
    }
    
    private func configureCornerLabel(_ label: UIView, size: CGSize, center: CGPoint) {
        
        label.frame.size = size
        label.center = center
        label.sizeToFit()
        
        
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay()
        setNeedsLayout()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureCornerLabel(cardOne, size: CGSize(width: bounds.width / 5, height: bounds.height / 8), center: CGPoint(x: bounds.midX,y: bounds.midY))
        
        configureCornerLabel(cardTwo, size: CGSize(width: bounds.width / 5, height: bounds.height / 8), center: CGPoint(x: bounds.midX / 2,y: bounds.midY / 2))
        
        
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
