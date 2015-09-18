//
//  Level1Clouds.swift
//  GR
//
//  Created by Shahnawaz Alam on 19/09/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class Level1Clouds: SKSpriteNode, EffectSprite {
    
    var cloud1 = SKSpriteNode(imageNamed: "cloud-07.png")
    var cloud2 = SKSpriteNode(imageNamed: "cloud-07.png")
    var cloud3 = SKSpriteNode(imageNamed: "cloud-07.png")
    var cloud4 = SKSpriteNode(imageNamed: "cloud-07.png")
    var createAction = SKAction()
    var removeAction = SKAction()
    
    func spawn(parentNode: SKNode, canvasSize: CGSize)
    {
        parentNode.addChild(self)
        
        cloud1.position = CGPointMake(canvasSize.width * 2, 2000)
        cloud1.setScale(0.4)
        cloud1.zPosition = -15
        self.addChild(cloud1)
        
        cloud2.position = CGPointMake(canvasSize.width * 0.32, 2000)
        cloud2.setScale(0.25)
        cloud2.zPosition = -15
        self.addChild(cloud2)
        
        cloud3.position = CGPointMake(canvasSize.width * 0.6, 2000)
        cloud3.setScale(0.35)
        cloud3.zPosition = -15
        self.addChild(cloud3)
        
        cloud4.position = CGPointMake(canvasSize.width * 0.75, 2000)
        cloud4.setScale(0.35)
        cloud4.zPosition = -15
        self.addChild(cloud4)
        
        //playCreateAnimation(canvasSize)
        
    }
    
    func playCreateAnimation(canvasSize: CGSize)
    {
        let moveCloud1 = SKAction.moveTo(CGPoint(x: -200, y: canvasSize.height * 0.9), duration: 2)
        let moveCloud2 = SKAction.moveTo(CGPoint(x: -50, y: canvasSize.height * 0.92), duration: 2)
        let moveCloud3 = SKAction.moveTo(CGPoint(x: 100, y: canvasSize.height * 0.87), duration: 2)
        let moveCloud4 = SKAction.moveTo(CGPoint(x: 350, y: canvasSize.height * 0.89), duration: 2)
        
        cloud1.runAction(moveCloud1)
        cloud2.runAction(moveCloud2)
        cloud3.runAction(moveCloud3)
        cloud4.runAction(moveCloud4)
    }
    
    func removeAnimation(canvasSize: CGSize)
    {
        let moveCloud1 = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.2, y: canvasSize.height * 1.3), duration: 2)
        let moveCloud2 = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.32, y: canvasSize.height * 1.3), duration: 2)
        let moveCloud3 = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.6, y: canvasSize.height * 1.3), duration: 2)
        let moveCloud4 = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.75, y: canvasSize.height * 1.3), duration: 2)
        
        cloud1.runAction(moveCloud1)
        cloud2.runAction(moveCloud2)
        cloud3.runAction(moveCloud3)
        cloud4.runAction(moveCloud4)
    }

}
