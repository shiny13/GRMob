//
//  level2Bins.swift
//  GR
//
//  Created by Shahnawaz Alam on 22/09/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class level2Bins: SKSpriteNode, EffectSprite {
    
    var bins = SKSpriteNode(imageNamed: "RecycleBin-03.png")
    var createAction = SKAction()
    var removeAction = SKAction()
    
    func spawn(parentNode: SKNode, canvasSize: CGSize)
    {
        parentNode.addChild(self)
        
        bins.position = CGPointMake(canvasSize.width * -0.15, 1000)
        bins.setScale(0.1)
        bins.zPosition = -15
        self.addChild(bins)
    }
    
    func playCreateAnimation(canvasSize: CGSize)
    {
        let moveBin = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.55, y: canvasSize.height * 0.4), duration: 2)
        bins.runAction(moveBin)
    }
    
    func removeAnimation(canvasSize: CGSize)
    {
        let moveBin = SKAction.moveTo(CGPoint(x: canvasSize.width * -0.15, y: canvasSize.height * 0.85), duration: 2)
        bins.runAction(moveBin)
    }
    
}
