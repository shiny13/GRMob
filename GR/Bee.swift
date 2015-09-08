//
//  Bee.swift
//  GR
//
//  Created by Shahnawaz Alam on 3/09/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class Bee: SKSpriteNode, GameSprite {
    
    //Store the texture atlas as a property
    var textureAtlas:SKTextureAtlas = SKTextureAtlas(named: "bee.atlas")
    var flyAnimation = SKAction()
        
    //Spawn func is used to draw the sprite into the world
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize) {
        parentNode.addChild(self)
        createAnimation()
        self.size = size
        self.position = position
        self.runAction(flyAnimation)
    }
    
    //This func takes care of animating the sprite if needed
    func createAnimation () {
        let flyFrames:[SKTexture] = [textureAtlas.textureNamed("bee.png"), textureAtlas.textureNamed("bee_fly.png")]
        let flyAction = SKAction.animateWithTextures(flyFrames, timePerFrame: 0.14)
        flyAnimation = SKAction.repeatActionForever(flyAction)
    }
    
    //This func makes the bee move from one stop to another
    func moveLeftRightForever(dur: NSTimeInterval) {
        //Setting up new action for the bee to move back and forth
        let pathLeft = SKAction.moveByX(-250, y: -10, duration: dur)
        let pathRight = SKAction.moveByX(250, y: 10, duration: dur)
        
        let flipTexttureNegative = SKAction.scaleXTo(-1, duration: 0)
        let flipTextturePositive = SKAction.scaleXTo(1, duration: 0)
        
        //Forming a sequence for the bee to follow
        let flightOfTheBee = SKAction.sequence([pathLeft,flipTexttureNegative,pathRight,flipTextturePositive])
        
        //This is a non-stop loop for the bee
        let neverEndingFlight = SKAction.repeatActionForever(flightOfTheBee)
        
        self.runAction(neverEndingFlight)
    }
    
    //This func defines the touch behaviour of the sprite
    func onTap() {
        
    }
    
}
