//
//  Background.swift
//  GR
//
//  Created by Shahnawaz Alam on 3/09/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class Background: SKSpriteNode {
    
    //movementMultiplier will store 0-1 value to indicate
    //how fast the background should move
    //0 means static and 1 means highest speed
    var movementMultiplier = CGFloat(0)
    
    //A constant background node size
    let backgroundSize = CGSize(width: 1000, height: 1000)
    
    func spawn(parentNode: SKNode, imageName:String, zPosition: CGFloat, movementMultiplier: CGFloat) {
        //Anchor position from the bottom left:
        self.anchorPoint = CGPointZero
        //Start background on top of the ice
        self.position = CGPoint(x: 0, y: 100)
        //To control the order of the background
        self.zPosition = zPosition
        //Store the movement multiplier
        self.movementMultiplier = movementMultiplier
        //Add this background to the parent node
        parentNode.addChild(self)
        
        //Build three child nodes for texture
        for i in -1...1 {
            let newBGNode = SKSpriteNode(imageNamed: imageName)
            //Set the size for this node
            newBGNode.size = backgroundSize
            //Anchor position is to the lower left
            newBGNode.anchorPoint = CGPointZero
            //Position this nackground node
            newBGNode.position = CGPoint (x: i * Int(backgroundSize.width), y: 0)
            //Add the node to the background
            self.addChild(newBGNode)
        }
        
    }
    
    //updatePosition method will be called every frame to reposition the background
    func updatePosition() {
        //calculate a position adjustment after the loop
        let adjustedPosition = 50 * (1 - movementMultiplier)
        
        //Adjust the position
        self.position.x = adjustedPosition
    }

}
