//
//  LevelComplete.swift
//  GR
//
//  Created by Shahnawaz Alam on 1/10/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class LevelComplete: SKSpriteNode, EffectSprite {

    let completed = SKSpriteNode (imageNamed: "EndComplete.png")
    let completeLabel = SKLabelNode(fontNamed:"Helvetica")
    let correctLabel = SKLabelNode(fontNamed:"Helvetica")
    let scoreLabel = SKLabelNode(fontNamed:"Helvetica")
    let star1 = SKSpriteNode (imageNamed: "power-up-star.png")
    let star2 = SKSpriteNode (imageNamed: "power-up-star.png")
    let star3 = SKSpriteNode (imageNamed: "power-up-star.png")
    let star4 = SKSpriteNode (imageNamed: "power-up-star.png")
    let star5 = SKSpriteNode (imageNamed: "power-up-star.png")
    
    func spawn(parentNode: SKNode, canvasSize: CGSize)
    {
        self.size = CGSize(width: 500, height: 400)
        self.position = CGPointMake(0 - completed.size.width, canvasSize.height * 0.3)
        self.zPosition = 0
        parentNode.addChild(self)
        
        completeLabel.text = "Level Completed!"
        completeLabel.fontSize = 40
        completeLabel.fontColor = SKColor(red: 0.94, green: 0.72, blue: 0.38, alpha: 1)
        completeLabel.zPosition = 5
        completeLabel.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.9)
        self.addChild(completeLabel)
        
        correctLabel.fontSize = 30
        correctLabel.fontColor = SKColor(red: 0.94, green: 0.72, blue: 0.38, alpha: 1)
        correctLabel.zPosition = 5
        correctLabel.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.75)
        self.addChild(correctLabel)
        
        scoreLabel.fontSize = 30
        scoreLabel.fontColor = SKColor(red: 0.94, green: 0.72, blue: 0.38, alpha: 1)
        scoreLabel.zPosition = 5
        scoreLabel.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.55)
        self.addChild(scoreLabel)
        
        star1.position = CGPointMake(self.size.width * 0.15, self.size.height * 0.35)
        star1.setScale(1)
        star1.zPosition = 5
        self.addChild(star1)
        
        star2.position = CGPointMake(self.size.width * 0.32, self.size.height * 0.35)
        star2.setScale(1)
        star2.zPosition = 5
        self.addChild(star2)
        
        star3.position = CGPointMake(self.size.width * 0.49, self.size.height * 0.35)
        star3.setScale(1)
        star3.zPosition = 5
        self.addChild(star3)
        
        star4.position = CGPointMake(self.size.width * 0.66, self.size.height * 0.35)
        star4.setScale(1)
        star4.zPosition = 5
        self.addChild(star4)
        
        star5.position = CGPointMake(self.size.width * 0.83, self.size.height * 0.35)
        star5.setScale(1)
        star5.zPosition = 5
        self.addChild(star5)
        
        completed.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5)
        completed.setScale(1)
        completed.zPosition = -10
        self.addChild(completed)
        
        let fadeAction = SKAction.fadeAlphaTo(0.25, duration: 0.001)
        star1.runAction(fadeAction)
        star2.runAction(fadeAction)
        star3.runAction(fadeAction)
        star4.runAction(fadeAction)
        star5.runAction(fadeAction)

    }
    
    func setCorrectQuestion( answers: Int, score: Int)
    {
        correctLabel.text = "You have \(answers) out of 5 correct. "
        scoreLabel.text = "Your score: \(score). "
    }
    
    func playCreateAnimation(canvasSize: CGSize)
    {
        
    }
    
    func starAnimation(answers: Int)
    {
        let unfadeAction = SKAction.fadeAlphaTo(1, duration: 0.5)
        switch(answers)
        {
            case 1: star1.runAction(unfadeAction)
                    break;
            case 2: star1.runAction(unfadeAction)
                    star2.runAction(unfadeAction)
                    break;
            case 3: star1.runAction(unfadeAction)
                    star2.runAction(unfadeAction)
                    star3.runAction(unfadeAction)
                    break;
            case 4: star1.runAction(unfadeAction)
                    star2.runAction(unfadeAction)
                    star3.runAction(unfadeAction)
                    star4.runAction(unfadeAction)
                    break;
            case 5: star1.runAction(unfadeAction)
                    star2.runAction(unfadeAction)
                    star3.runAction(unfadeAction)
                    star4.runAction(unfadeAction)
                    star5.runAction(unfadeAction)
                    break;
            default:
                    break;
        }
    }
    
    func removeAnimation(canvasSize: CGSize)
    {
        
    }
    
}
