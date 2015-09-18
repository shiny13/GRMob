//
//  TipSprite.swift
//  GR
//
//  Created by Shahnawaz Alam on 4/09/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class TipSprite: SKSpriteNode {
    
    var spawnAction = SKAction()
    var cancelAction = SKAction()
    
    //A constant background node size
    let backgroundSize = CGSize(width: 384, height: 288)
    let label: SKLabelNode = SKLabelNode(fontNamed: "Helvetica")
    
    func spawn(parentNode: SKNode, imageName:String, zPosition: CGFloat, tip: String) {
        
        //Anchor position from the bottom left:
        self.anchorPoint = CGPointZero
        //Start background on top of the ice
        self.position = CGPoint(x: -250, y: 100)
        //To control the order of the background
        self.zPosition = zPosition
        //Add this background to the parent node
        parentNode.addChild(self)
        
        //Add background image
        let newBGNode = SKSpriteNode(imageNamed: imageName)
        //Set the size for this node
        newBGNode.size = backgroundSize
        //Anchor position is to the lower left
        newBGNode.anchorPoint = CGPointZero
        //Position this nackground node
        newBGNode.position = CGPoint (x: 0, y: 0)
        //Add the node to the background
        self.addChild(newBGNode)
        
        label.text = tip
        label.fontSize = 30
        label.fontColor = SKColor(red: 0.76, green: 0.42, blue: 0.18, alpha: 1)
        label.position = CGPointMake(backgroundSize.width * 0.5, backgroundSize.height * 0.8)
        self.addChild(label)
        
    }
    
    func createAnimations () {
        spawnAction = SKAction.scaleTo(1, duration: 1.5)
        cancelAction = SKAction.scaleTo(0, duration: 1.5)
    }
    
    func runSpawnAction(){
        self.runAction(spawnAction)
    }
    
    func runCancelAction() {
        self.runAction(cancelAction)
    }
   
}
