//
//  CounterSprite.swift
//  GR
//
//  Created by Shahnawaz Alam on 18/09/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class CounterSprite: SKSpriteNode {
    
    var spawnAction = SKAction()
    var unfadeAction = SKAction()
    var counter: SKSpriteNode = SKSpriteNode()
    
    //A constant background node size
    let backgroundSize = CGSize(width: 384, height: 288)
    let label: SKLabelNode = SKLabelNode(fontNamed: "Helvetica")
    
    func spawn(parentNode: SKNode, imageName:String) {
        
        //Anchor position from the bottom left:
        self.anchorPoint = CGPointZero
        //Start background on top of the ice
        self.position = CGPoint(x: -250, y: 0)
        //To control the order of the background
        self.zPosition = zPosition
        //Add this background to the parent node
        parentNode.addChild(self)
        
        //Add background image
        var newNode = SKSpriteNode(imageNamed: imageName)
        //Set the size for this node
        newNode.size = backgroundSize
        //Anchor position is to the lower left
        newNode.anchorPoint = CGPointZero
        //Position this nackground node
        newNode.position = CGPoint (x: 0, y: 0)
        //Add the node to the background
        self.addChild(newNode)
                
    }
    
    func changeTip(tip: String)
    {
        label.text = tip
    }
    
    func createAnimations () {
        spawnAction = SKAction.scaleTo(1, duration: 1)
        unfadeAction = SKAction.scaleTo(0, duration: 1)
    }
    
    func runSpawnAction(){
        self.runAction(spawnAction)
    }
    
    func runUnfadeAction() {
        self.runAction(unfadeAction)
    }

}
