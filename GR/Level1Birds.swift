//
//  Level1Birds.swift
//  GR
//
//  Created by Shahnawaz Alam on 19/09/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class Level1Birds: SKSpriteNode, EffectSprite {
    
    var bird1 = SKSpriteNode(imageNamed: "bird-03.png")
    var bird2 = SKSpriteNode(imageNamed: "bird-03.png")
    var bird3 = SKSpriteNode(imageNamed: "bird-03.png")
    var createAction = SKAction()
    var removeAction = SKAction()
    
    func spawn(parentNode: SKNode, canvasSize: CGSize)
    {
        parentNode.addChild(self)
        
        bird1.position = CGPointMake(canvasSize.width * -0.15, 1000)
        bird1.setScale(0.15)
        bird1.zPosition = -15
        self.addChild(bird1)
        
        bird2.position = CGPointMake(canvasSize.width * -0.15, 1000)
        bird2.setScale(0.1)
        bird1.zPosition = -15
        self.addChild(bird2)
        
        bird3.position = CGPointMake(canvasSize.width * -1.15, 1000)
        bird3.setScale(0.2)
        bird1.zPosition = -15
        self.addChild(bird3)
        
        //playCreateAnimation(canvasSize)
        
    }
    
    func playCreateAnimation(canvasSize: CGSize)
    {
        let moveBird1 = SKAction.moveTo(CGPoint(x: -150, y: canvasSize.height * 0.85), duration: 2)
        let moveBird2 = SKAction.moveTo(CGPoint(x: -175, y: canvasSize.height * 0.72), duration: 2)
        let moveBird3 = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.6, y: canvasSize.height * 0.85), duration: 2)
        
        bird1.runAction(moveBird1)
        bird2.runAction(moveBird2)
        bird3.runAction(moveBird3)
    }
    
    func removeAnimation(canvasSize: CGSize)
    {
        let moveBird1 = SKAction.moveTo(CGPoint(x: canvasSize.width * -0.15, y: canvasSize.height * 0.85), duration: 2)
        let moveBird2 = SKAction.moveTo(CGPoint(x: canvasSize.width * -0.15, y: canvasSize.height * 0.72), duration: 2)
        let moveBird3 = SKAction.moveTo(CGPoint(x: canvasSize.width * 1.15, y: canvasSize.height * 0.85), duration: 2)
        
        bird1.runAction(moveBird1)
        bird2.runAction(moveBird2)
        bird3.runAction(moveBird3)
    }
}
