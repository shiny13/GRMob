//
//  Level2Grass.swift
//  GR
//
//  Created by Shahnawaz Alam on 22/09/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class Level2Grass: SKSpriteNode, EffectSprite {
    
    var grass1 = SKSpriteNode(imageNamed: "grass-02.png")
    var grass2 = SKSpriteNode(imageNamed: "grass-02.png")
    var grass3 = SKSpriteNode(imageNamed: "grass-02.png")
    var createAction = SKAction()
    var removeAction = SKAction()
    
    func spawn(parentNode: SKNode, canvasSize: CGSize)
    {
        parentNode.addChild(self)
        
        grass1.position = CGPointMake(canvasSize.width * 3, -1000)
        grass1.setScale(0.42)
        grass1.zPosition = -15
        self.addChild(grass1)
        
        grass2.position = CGPointMake(canvasSize.width * 0.4, -1000)
        grass2.setScale(0.43)
        grass2.zPosition = -15
        self.addChild(grass2)
        
        grass3.position = CGPointMake(canvasSize.width * 0.6, -1000)
        grass3.setScale(0.44)
        grass3.zPosition = -15
        self.addChild(grass3)
        
        //playCreateAnimation(canvasSize)
        
    }
    
    func playCreateAnimation(canvasSize: CGSize)
    {
        let moveGrass1 = SKAction.moveTo(CGPoint(x: 0, y: canvasSize.height * 0.12), duration: 2)
        let moveGrass2 = SKAction.moveTo(CGPoint(x: 200, y: canvasSize.height * 0.12), duration: 2)
        let moveGrass3 = SKAction.moveTo(CGPoint(x: 550, y: canvasSize.height * 0.12), duration: 2)
        grass1.runAction(moveGrass1)
        grass2.runAction(moveGrass2)
        grass3.runAction(moveGrass3)
    }
    
    func removeAnimation(canvasSize: CGSize)
    {
        let moveGrass1 = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.2, y: canvasSize.height * -0.3), duration: 2)
        let moveGrass2 = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.32, y: canvasSize.height * -0.3), duration: 2)
        let moveGrass3 = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.66, y: canvasSize.height * -0.3), duration: 2)
        
        grass1.runAction(moveGrass1)
        grass2.runAction(moveGrass2)
        grass3.runAction(moveGrass3)
        
    }


    
}
