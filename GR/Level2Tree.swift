//
//  Level2Tree.swift
//  GR
//
//  Created by Shahnawaz Alam on 22/09/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class Level2Tree: SKSpriteNode, EffectSprite {
    
    var tree = SKSpriteNode(imageNamed: "tree-04.png")
    var createAction = SKAction()
    var removeAction = SKAction()
    
    func spawn(parentNode: SKNode, canvasSize: CGSize)
    {
        parentNode.addChild(self)
        
        tree.position = CGPointMake(canvasSize.width * -0.15, 1000)
        tree.setScale(0.4)
        tree.zPosition = -15
        self.addChild(tree)
    }
    
    func playCreateAnimation(canvasSize: CGSize)
    {
        let moveTree = SKAction.moveTo(CGPoint(x: canvasSize.width * 0.32, y: canvasSize.height * 0.55), duration: 2)
        tree.runAction(moveTree)
    }
    
    func removeAnimation(canvasSize: CGSize)
    {
        let moveTree = SKAction.moveTo(CGPoint(x: canvasSize.width * -0.15, y: canvasSize.height * 0.85), duration: 2)
        tree.runAction(moveTree)
    }


    
}
