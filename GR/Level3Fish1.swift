//
//  Level3Fish1.swift
//  GR
//
//  Created by Shahnawaz Alam on 22/09/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class Level3Fish1: SKSpriteNode, EffectSprite {
    
    var fish1 = SKSpriteNode(imageNamed: "fish-01.png")
    var fish2 = SKSpriteNode(imageNamed: "fish-01.png")
    var fish3 = SKSpriteNode(imageNamed: "fish-01.png")
    var createAction = SKAction()
    var removeAction = SKAction()
    
    func spawn(parentNode: SKNode, canvasSize: CGSize)
    {
        parentNode.addChild(self)
        
        fish1.position = CGPointMake(canvasSize.width * 3, -1000)
        fish1.setScale(0.2)
        fish1.zPosition = -15
        self.addChild(fish1)
        
        fish2.position = CGPointMake(canvasSize.width * 0.4, -1000)
        fish2.setScale(0.3)
        fish2.zPosition = -15
        self.addChild(fish2)
        
        fish3.position = CGPointMake(canvasSize.width * 0.6, -1000)
        fish3.setScale(0.24)
        fish3.zPosition = -15
        self.addChild(fish3)
        
        //playCreateAnimation(canvasSize)
        
    }
    
    func playCreateAnimation(canvasSize: CGSize)
    {
        let moveFish1 = SKAction.moveTo(CGPoint(x: -250, y: canvasSize.height * 0.45), duration: 2)
        let moveFish2 = SKAction.moveTo(CGPoint(x: -150, y: canvasSize.height * 0.34), duration: 2)
        let moveFish3 = SKAction.moveTo(CGPoint(x: -50, y: canvasSize.height * 0.4), duration: 2)
        fish1.runAction(moveFish1)
        fish2.runAction(moveFish2)
        fish3.runAction(moveFish3)
    }
    
    func removeAnimation(canvasSize: CGSize)
    {
        /*let moveGrass1 = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.2, y: canvasSize.height * -0.3), duration: 2)
        let moveGrass2 = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.32, y: canvasSize.height * -0.3), duration: 2)
        let moveGrass3 = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.66, y: canvasSize.height * -0.3), duration: 2)
        
        grass1.runAction(moveGrass1)
        grass2.runAction(moveGrass2)
        grass3.runAction(moveGrass3)*/
        
    }

    
}
