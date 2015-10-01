//
//  Level4Horse.swift
//  GR
//
//  Created by Shahnawaz Alam on 22/09/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class Level4Horse: SKSpriteNode, EffectSprite {

    var horse1 = SKSpriteNode(imageNamed: "horse-01.png")
    var horse2 = SKSpriteNode(imageNamed: "horse-01.png")
    var horse3 = SKSpriteNode(imageNamed: "horse-01.png")
    var createAction = SKAction()
    var removeAction = SKAction()
    
    func spawn(parentNode: SKNode, canvasSize: CGSize)
    {
        parentNode.addChild(self)
        
        horse1.position = CGPointMake(-200, -200)
        horse1.setScale(0.2)
        horse1.zPosition = -10
        self.addChild(horse1)
        
        horse2.position = CGPointMake(50, -200)
        horse2.setScale(0.15)
        horse2.zPosition = -10
        self.addChild(horse2)
        
        horse3.position = CGPointMake(300, -200)
        horse3.setScale(0.175)
        horse3.zPosition = -10
        self.addChild(horse3)
        
        //playCreateAnimation(canvasSize)
        
    }
    
    func playCreateAnimation(canvasSize: CGSize)
    {
        let moveHorse1 = SKAction.moveTo(CGPoint(x: -200, y: canvasSize.height * 0.175), duration: 2)
        let moveHorse2 = SKAction.moveTo(CGPoint(x: -100, y: canvasSize.height * 0.175), duration: 2)
        let moveHorse3 = SKAction.moveTo(CGPoint(x: 250, y: canvasSize.height * 0.175), duration: 2)
        
        horse1.runAction(moveHorse1)
        horse2.runAction(moveHorse2)
        horse3.runAction(moveHorse3)
    }
    
    func removeAnimation(canvasSize: CGSize)
    {
        let moveHorse1 = SKAction.moveTo(CGPoint(x: canvasSize.width * -0.15, y: canvasSize.height * 0.07), duration: 2)
        let moveHorse2 = SKAction.moveTo(CGPoint(x: canvasSize.width * -0.15, y: canvasSize.height * 0.15), duration: 2)
        let moveHorse3 = SKAction.moveTo(CGPoint(x: canvasSize.width * 1.15, y: canvasSize.height * 0.1), duration: 2)
        
        horse1.runAction(moveHorse1)
        horse2.runAction(moveHorse2)
        horse3.runAction(moveHorse3)
    }
    
}
