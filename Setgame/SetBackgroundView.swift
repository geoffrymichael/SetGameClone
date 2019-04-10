//
//  SetBackgroundView.swift
//  Setgame
//
//  Created by Geoffry Gambling on 4/8/19.
//  Copyright © 2019 Geoffry Gambling. All rights reserved.
//

import UIKit



class SetBackgroundView: UIView {

    
    
//    private lazy var cardOne = createCard()
//    private lazy var cardTwo = createCard()
    
    var viewArray = [UIView]()
    
    //Create an array of cardViews(Setgameviews)
    private func createCard() {
        let label = SetgameView()
        

        addSubview(label)
        
        viewArray.append(label)

       
    }
    
    //Configure the Setviewcard and override its layout and position
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
        
        
        
        
        
        //Declare a grid. This is a standin as it is static for a 12 view grid
        var grid = Grid(layout: Grid.Layout.dimensions(rowCount: 3, columnCount: 4), frame: CGRect(origin: CGPoint(x: self.bounds.minX, y: self.bounds.minY), size: CGSize(width: self.bounds.width, height: self.bounds.height)))
        
        //The 0...11 here is just a standin for initially putting twelve cards in the view
        for card in 0...11 {
            createCard()
            configureCornerLabel(viewArray[card], size: CGSize(width: grid[card]?.width ?? bounds.width, height: grid[card]?.height ?? bounds.height),center: CGPoint(x: grid[card]?.midX ?? bounds.midX, y: grid[card]?.midY ?? bounds.midY) )
        }
        
        print(subviews[0].tag)
        
        
        //TODO This is accessing the autolayout card. Maybe it should be replaced by attributes of first card in deck data set.
        let firstCard = subviews[0]
        
        print(firstCard)
        
        
        
        
        configureCornerLabel(firstCard, size: CGSize(width: grid[11]?.width ?? bounds.width, height: grid[11]?.height ?? bounds.height),center: CGPoint(x: grid[11]?.midX ?? bounds.midX, y: grid[11]?.midY ?? bounds.midY) )
        
        
        
        
        
        
        
        
        
//        configureCornerLabel(cardOne, size: CGSize(width: grid[0]?.width ?? bounds.width, height: grid[0]?.height ?? bounds.height),center: CGPoint(x: grid[0]?.midX ?? bounds.midX, y: grid[0]?.midY ?? bounds.midY) )
//
//        configureCornerLabel(cardTwo, size: CGSize(width: grid[1]?.width ?? bounds.width, height: grid[1]?.height ?? bounds.height),center: CGPoint(x: grid[1]?.midX ?? bounds.midX, y: grid[1]?.midY ?? bounds.midY) )
        
        
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
