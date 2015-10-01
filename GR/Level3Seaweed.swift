//
//  Level3Seaweed.swift
//  GR
//
//  Created by Shahnawaz Alam on 22/09/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class Level3Seaweed: SKSpriteNode, EffectSprite {
    
    var seaweed1 = SKSpriteNode(imageNamed: "sea_weed-01.png")
    var seaweed2 = SKSpriteNode(imageNamed: "sea_weed-01.png")
    var seaweed3 = SKSpriteNode(imageNamed: "sea_weed-02.png")
    var seaweed4 = SKSpriteNode(imageNamed: "sea_weed-02.png")
    var seaweed5 = SKSpriteNode(imageNamed: "sea_weed-02.png")
    var seaweed6 = SKSpriteNode(imageNamed: "sea_weed-02.png")
    var createAction = SKAction()
    var removeAction = SKAction()
    
    func spawn(parentNode: SKNode, canvasSize: CGSize)
    {
        parentNode.addChild(self)
        
        seaweed1.position = CGPointMake(canvasSize.width * -0.15, 2000)
        seaweed1.setScale(0.4)
        seaweed1.zPosition = -15
        self.addChild(seaweed1)
        
        seaweed2.position = CGPointMake(canvasSize.width * -0.15, 2000)
        seaweed2.setScale(0.3)
        seaweed2.zPosition = -15
        self.addChild(seaweed2)
        
        seaweed3.position = CGPointMake(canvasSize.width * -0.15, 2000)
        seaweed3.setScale(0.35)
        seaweed3.zPosition = -15
        self.addChild(seaweed3)
        
        seaweed4.position = CGPointMake(canvasSize.width * -0.15, 2000)
        seaweed4.setScale(0.3)
        seaweed4.zPosition = -15
        self.addChild(seaweed4)
        
        seaweed5.position = CGPointMake(canvasSize.width * -0.15, 2000)
        seaweed5.setScale(0.25)
        seaweed5.zPosition = -15
        self.addChild(seaweed5)
        
        seaweed6.position = CGPointMake(canvasSize.width * -0.15, 2000)
        seaweed6.setScale(0.25)
        seaweed6.zPosition = -15
        self.addChild(seaweed6)
        
    }
    
    func playCreateAnimation(canvasSize: CGSize)
    {
        let moveSeaweed = SKAction.moveTo(CGPoint(x: -250, y: canvasSize.height * 0.19), duration: 2)
        seaweed1.runAction(moveSeaweed)
        
        let moveSeaweed2 = SKAction.moveTo(CGPoint(x: -100, y: canvasSize.height * 0.22), duration: 2)
        seaweed2.runAction(moveSeaweed2)
        
        let moveSeaweed3 = SKAction.moveTo(CGPoint(x: 50, y: canvasSize.height * 0.18), duration: 2)
        seaweed3.runAction(moveSeaweed3)
        
        let moveSeaweed4 = SKAction.moveTo(CGPoint(x: 350, y: canvasSize.height * 0.21), duration: 2)
        seaweed4.runAction(moveSeaweed4)
        
        let moveSeaweed5 = SKAction.moveTo(CGPoint(x: 450, y: canvasSize.height * 0.175), duration: 2)
        seaweed5.runAction(moveSeaweed5)
        
        let moveSeaweed6 = SKAction.moveTo(CGPoint(x: 400, y: canvasSize.height * 0.185), duration: 2)
        seaweed6.runAction(moveSeaweed6)
    }
    
    func removeAnimation(canvasSize: CGSize)
    {
        /*let moveRainbow = SKAction.moveTo(CGPoint(x: canvasSize.width * -0.15, y: canvasSize.height * 0.85), duration: 2)
        seaweed1.runAction(moveRainbow)
        
        let moveRainbow2 = SKAction.moveTo(CGPoint(x: canvasSize.width * -0.15, y: canvasSize.height * 0.85), duration: 2)
        seaweed2.runAction(moveRainbow2)
        
        let moveRainbow3 = SKAction.moveTo(CGPoint(x: canvasSize.width * -0.15, y: canvasSize.height * 0.85), duration: 2)
        seaweed3.runAction(moveRainbow3)
        
        let moveRainbow4 = SKAction.moveTo(CGPoint(x: canvasSize.width * -0.15, y: canvasSize.height * 0.85), duration: 2)
        seaweed4.runAction(moveRainbow4)
        
        let moveRainbow5 = SKAction.moveTo(CGPoint(x: canvasSize.width * -0.15, y: canvasSize.height * 0.85), duration: 2)
        seaweed5.runAction(moveRainbow5)*/
    }
    
}
