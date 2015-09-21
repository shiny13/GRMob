//
//  Level1Grass.swift
//  GR
//
//  Created by Shahnawaz Alam on 19/09/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class Level1Grass: SKSpriteNode, EffectSprite {
    
    var grass1 = SKSpriteNode(imageNamed: "grass-02.png")
    var grass2 = SKSpriteNode(imageNamed: "grass-02.png")
    var grass3 = SKSpriteNode(imageNamed: "grass-02.png")
    var grass4 = SKSpriteNode(imageNamed: "grass-02.png")
    var createAction = SKAction()
    var removeAction = SKAction()
    
    func spawn(parentNode: SKNode, canvasSize: CGSize)
    {
        parentNode.addChild(self)
        
        grass1.position = CGPointMake(canvasSize.width * 2, -1000)
        grass1.setScale(0.4)
        grass1.zPosition = -15
        self.addChild(grass1)
        
        grass2.position = CGPointMake(canvasSize.width * 0.32, -1000)
        grass2.setScale(0.25)
        grass2.zPosition = -15
        self.addChild(grass2)
        
        grass3.position = CGPointMake(canvasSize.width * 0.6, -1000)
        grass3.setScale(0.35)
        grass3.zPosition = -15
        self.addChild(grass3)
        
        grass4.position = CGPointMake(canvasSize.width * 0.75, -1000)
        grass4.setScale(0.35)
        grass4.zPosition = -15
        self.addChild(grass4)
        
        //playCreateAnimation(canvasSize)
        
    }
    
    func playCreateAnimation(canvasSize: CGSize)
    {
        let moveGrass1 = SKAction.moveTo(CGPoint(x: -200, y: canvasSize.height * 0.17), duration: 2)
        let moveGrass2 = SKAction.moveTo(CGPoint(x: 200, y: canvasSize.height * 0.3), duration: 2)
        let moveGrass3 = SKAction.moveTo(CGPoint(x: 300, y: canvasSize.height * 0.25), duration: 2)
        let moveGrass4 = SKAction.moveTo(CGPoint(x: 440, y: canvasSize.height * 0.35), duration: 2)
        
        grass1.runAction(moveGrass1)
        grass2.runAction(moveGrass2)
        grass3.runAction(moveGrass3)
        grass4.runAction(moveGrass4)
        
    }
    
    func removeAnimation(canvasSize: CGSize)
    {
        let moveGrass1 = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.2, y: canvasSize.height * -0.3), duration: 2)
        let moveGrass2 = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.32, y: canvasSize.height * -0.3), duration: 2)
        let moveGrass3 = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.66, y: canvasSize.height * -0.3), duration: 2)
        let moveGrass4 = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.8, y: canvasSize.height * -0.3), duration: 2)
        
        grass1.runAction(moveGrass1)
        grass2.runAction(moveGrass2)
        grass3.runAction(moveGrass3)
        grass4.runAction(moveGrass4)
        
    }
    
}
