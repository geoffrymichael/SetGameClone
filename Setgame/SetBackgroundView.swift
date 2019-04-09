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
        
        
        
        var grid = Grid(layout: Grid.Layout.dimensions(rowCount: 3, columnCount: 4), frame: CGRect(origin: CGPoint(x: bounds.midX, y: bounds.midY), size: CGSize(width: bounds.width, height: bounds.height)))
        
        configureCornerLabel(cardOne, size: CGSize(width: grid[0]?.width ?? bounds.width, height: grid[0]?.height ?? bounds.height),center: CGPoint(x: grid[0]?.midX ?? bounds.midX, y: grid[0]?.midY ?? bounds.midY) )
        
        configureCornerLabel(cardTwo, size: CGSize(width: grid[1]?.width ?? bounds.width, height: grid[1]?.height ?? bounds.height),center: CGPoint(x: grid[1]?.midX ?? bounds.midX, y: grid[1]?.midY ?? bounds.midY) )
        
        
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
