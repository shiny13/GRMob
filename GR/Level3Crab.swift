//
//  Level3Crab.swift
//  GR
//
//  Created by Shahnawaz Alam on 22/09/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class Level3Crab: SKSpriteNode, EffectSprite {
    
    var crab1 = SKSpriteNode(imageNamed: "crab.png")
    var crab2 = SKSpriteNode(imageNamed: "crab.png")
    var createAction = SKAction()
    var removeAction = SKAction()
    
    func spawn(parentNode: SKNode, canvasSize: CGSize)
    {
        parentNode.addChild(self)
        
        crab1.position = CGPointMake(canvasSize.width * 3, -1000)
        crab1.setScale(0.15)
        crab1.zPosition = -10
        self.addChild(crab1)
        
        crab2.position = CGPointMake(canvasSize.width * 0.4, -1000)
        crab2.setScale(0.22)
        crab2.zPosition = -10
        self.addChild(crab2)
        
        //playCreateAnimation(canvasSize)
        
    }
    
    func playCreateAnimation(canvasSize: CGSize)
    {
        let moveCrab1 = SKAction.moveTo(CGPoint(x: 100, y: canvasSize.height * 0.35), duration: 2)
        let moveCrab2 = SKAction.moveTo(CGPoint(x: 350, y: canvasSize.height * 0.25), duration: 2)
        crab1.runAction(moveCrab1)
        crab2.runAction(moveCrab2)
    }
    
    func removeAnimation(canvasSize: CGSize)
    {
        
    }

}
