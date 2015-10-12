//
//  IntroScene.swift
//  GR
//
//  Created by Shahnawaz Alam on 13/10/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class IntroScene: SKScene {
    
    let girl1 = SKSpriteNode(imageNamed: "girl-01.png")
    let girl2 = SKSpriteNode(imageNamed: "girl-02.png")
    let boy1 = SKSpriteNode(imageNamed: "boy-01.png")
    let boy2 = SKSpriteNode(imageNamed: "boy-02.png")
    let cloud1 = SKSpriteNode(imageNamed: "cloud-01.png")
    let cloud2 = SKSpriteNode(imageNamed: "cloud-02.png")
    let cloud3 = SKSpriteNode(imageNamed: "cloud-03.png")
    let cloud4 = SKSpriteNode(imageNamed: "cloud-04.png")
    
    override func didMoveToView(view: SKView) {
        
        let bg = SKSpriteNode(imageNamed: "st_bg2.png")
        bg.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5)
        bg.zPosition = -10
        bg.setScale(0.5)
        self.addChild(bg)
        
        girl1.position = CGPointMake(-500, self.size.height * 0.75)
        girl1.zPosition = -5
        girl1.setScale(0.5)
        self.addChild(girl1)
        
        cloud1.position = CGPointMake(-500, self.size.height * 0.88)
        cloud1.zPosition = -8
        cloud1.setScale(0.5)
        self.addChild(cloud1)
        
        boy1.position = CGPointMake(2700, self.size.height * 0.75)
        boy1.zPosition = -5
        boy1.setScale(0.5)
        self.addChild(boy1)
        
        cloud2.position = CGPointMake(2700, self.size.height * 0.88)
        cloud2.zPosition = -8
        cloud2.setScale(0.5)
        self.addChild(cloud2)
        
        girl2.position = CGPointMake(-500, self.size.height * 0.25)
        girl2.zPosition = -5
        girl2.setScale(0.5)
        self.addChild(girl2)
        
        cloud3.position = CGPointMake(-500, self.size.height * 0.38)
        cloud3.zPosition = -8
        cloud3.setScale(0.5)
        self.addChild(cloud3)
        
        boy2.position = CGPointMake(2700, self.size.height * 0.25)
        boy2.zPosition = -5
        boy2.setScale(0.5)
        self.addChild(boy2)
        
        cloud4.position = CGPointMake(2700, self.size.height * 0.38)
        cloud4.zPosition = -8
        cloud4.setScale(0.5)
        self.addChild(cloud4)
        
        moveSprites()
        
    }
    
    func moveSprites()
    {
        let movegirl1 = SKAction.moveTo(CGPointMake(self.size.width * 0.25, self.size.height * 0.75), duration: 0.5)
        girl1.runAction(movegirl1)
        
        let wait1 = SKAction.waitForDuration(0.35)
        let moveCloud1 = SKAction.moveTo(CGPointMake(self.size.width * 0.4, self.size.height * 0.88), duration: 0.5)
        cloud1.runAction(SKAction.sequence([wait1, moveCloud1]))
        
        let wait2 = SKAction.waitForDuration(0.75)
        let moveboy1 = SKAction.moveTo(CGPointMake(self.size.width * 0.75, self.size.height * 0.75), duration: 0.5)
        boy1.runAction(SKAction.sequence([wait2, moveboy1]))
        
        let wait3 = SKAction.waitForDuration(1)
        let moveCloud2 = SKAction.moveTo(CGPointMake(self.size.width * 0.88, self.size.height * 0.88), duration: 0.5)
        cloud2.runAction(SKAction.sequence([wait3, moveCloud2]))
        
        let wait4 = SKAction.waitForDuration(1.5)
        let movegirl2 = SKAction.moveTo(CGPointMake(self.size.width * 0.25, self.size.height * 0.25), duration: 0.5)
        girl2.runAction(SKAction.sequence([wait4, movegirl2]))
        
        let wait5 = SKAction.waitForDuration(1.75)
        let moveCloud3 = SKAction.moveTo(CGPointMake(self.size.width * 0.4, self.size.height * 0.38), duration: 0.5)
        cloud3.runAction(SKAction.sequence([wait5, moveCloud3]))
        
        let wait6 = SKAction.waitForDuration(2.5)
        let moveboy2 = SKAction.moveTo(CGPointMake(self.size.width * 0.75, self.size.height * 0.25), duration: 0.5)
        boy2.runAction(SKAction.sequence([wait6, moveboy2]))
        
        let wait7 = SKAction.waitForDuration(2.75)
        let moveCloud4 = SKAction.moveTo(CGPointMake(self.size.width * 0.88, self.size.height * 0.38), duration: 0.5)
        cloud4.runAction(SKAction.sequence([wait7, moveCloud4]))
        
        let wait8 = SKAction.waitForDuration(5.5)
        let transition = SKAction.runBlock({
            self.userInteractionEnabled = true
            let transition = SKTransition.crossFadeWithDuration(0.5)
            let scene = GameScene(size: self.size)
            self.view?.presentScene(scene, transition: transition)
        })
        girl1.runAction(SKAction.sequence([wait8, transition]))
    }
    
}
