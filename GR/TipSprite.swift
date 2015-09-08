//
//  TipSprite.swift
//  GR
//
//  Created by Shahnawaz Alam on 4/09/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class TipSprite: SKSpriteNode {
    
    var tipSprite:SKSpriteNode = SKSpriteNode(imageNamed: "bluepanel1.png")
    var spawnAction = SKAction()
    var cancelAction = SKAction()
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize){
        parentNode.addChild(self)
        self.setScale(0)
        self.size = size
        self.position = position
        createAnimations()
    }
    
    func createAnimations () {
        spawnAction = SKAction.scaleTo(1, duration: 1.5)
        cancelAction = SKAction.scaleTo(0, duration: 1.5)
    }
    
    func runSpawnAction(){
        tipSprite.runAction(spawnAction)
    }
    
    func runCancelAction() {
        tipSprite.runAction(cancelAction)
    }
   
}
