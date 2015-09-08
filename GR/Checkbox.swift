//
//  Checkbox.swift
//  GR
//
//  Created by Shahnawaz Alam on 4/09/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class Checkbox: SKSpriteNode, GameSprite {
    
    //Store the texture atlas as a property
    var textureAtlas:SKTextureAtlas = SKTextureAtlas(named: "checkbox.atlas")
    var checkAnimation = SKAction()
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize) {
        parentNode.addChild(self)
        //self.setScale(0.15)
        createAnimation()
        self.size = size
        self.position = position
    }
    
    //This func takes care of animating the sprite if needed
    func createAnimation () {
        let checkFrames:[SKTexture] = [textureAtlas.textureNamed("unchecked.png"), textureAtlas.textureNamed("checked.png")]
        checkAnimation = SKAction.animateWithTextures(checkFrames, timePerFrame: 0.1)
    }
    
    func onTap() {
        self.runAction(checkAnimation)
    }
}
