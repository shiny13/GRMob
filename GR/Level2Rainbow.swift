//
//  Level2Rainbow.swift
//  GR
//
//  Created by Shahnawaz Alam on 22/09/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class Level2Rainbow: SKSpriteNode, EffectSprite {

    var rainbow = SKSpriteNode(imageNamed: "Rainbow-01.png")
    var createAction = SKAction()
    var removeAction = SKAction()
    
    func spawn(parentNode: SKNode, canvasSize: CGSize)
    {
        parentNode.addChild(self)
        
        rainbow.position = CGPointMake(canvasSize.width * -0.15, 3000)
        rainbow.setScale(1.0)
        rainbow.zPosition = -15
        self.addChild(rainbow)
    }
    
    func playCreateAnimation(canvasSize: CGSize)
    {
        let moveRainbow = SKAction.moveTo(CGPoint(x: 50, y: canvasSize.height * 0.75), duration: 2)
        rainbow.runAction(moveRainbow)
    }
    
    func removeAnimation(canvasSize: CGSize)
    {
        let moveRainbow = SKAction.moveTo(CGPoint(x: canvasSize.width * -0.15, y: canvasSize.height * 0.85), duration: 2)
        rainbow.runAction(moveRainbow)
    }

    
}
