//
//  GameScene.swift
//  GR
//
//  Created by Shahnawaz Alam on 31/08/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    
    // Create the world as a generic SKNode
    let world = SKNode()
    
    let nextButton: SKSpriteNode = SKSpriteNode(imageNamed: "Next.png")
    let skipButton = SKSpriteNode(imageNamed: "skip.png")
    var bgImage = SKSpriteNode(imageNamed: "signs_of_spring_2-wallpaper-1024x1024.jpg")
    
    func spawnBees()
    {
        //Creating 2 bee sprites
        let bee1 = Bee()
        let bee2 = Bee()
        
        //Using the spawn function to draw the sprite to the screen
        bee1.spawn(world, position: CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.8), size: CGSize(width: 28, height: 24))
        bee2.spawn(world, position: CGPoint(x: self.size.width * 0.3, y: self.size.height * 0.65), size: CGSize(width: 28, height: 24))
        
        //Make the bees move
        bee1.moveLeftRightForever(1)
        bee2.moveLeftRightForever(1.4)
    }
    
    override func didMoveToView(view: SKView) {
        
        // Add the world node as a child of the scene
        self.addChild(world)
        
        bgImage.position = CGPointMake(self.size.width/2, self.size.height/2)
        self.addChild(bgImage)
        
        nextButton.position = CGPointMake(nextButton.size.width/2, nextButton.size.height/2 + 80)
        nextButton.name = "nextButton"
        self.addChild(nextButton)
        
        skipButton.position = CGPointMake(self.size.width/2, skipButton.size.height/2 + 5)
        skipButton.name = "skipButton"
        skipButton.setScale(0.5)
        self.addChild(skipButton)
        
        //Create action for the sprite
        //let moveAction = SKAction.moveTo(CGPoint(x: self.size.width/2, y: nextButton.size.height + 80), duration: 5)
        let moveAction = SKAction.moveTo(CGPoint(x:self.size.width/2, y:nextButton.size.height/2 + 80), duration: 1.5)
        let scaleAction = SKAction.scaleTo(0.3, duration: 1.5)
        let rotateAction = SKAction.rotateByAngle(-6.28318531, duration: 1.5)
        let scaleAction2 = SKAction.scaleTo(0.5, duration: 1.25)
        
        //Creating action groups with multiple actions on a node
        let actionGroup1 = SKAction.group([moveAction, scaleAction, rotateAction])
        let actionGroup2 = SKAction.group([scaleAction, rotateAction])
        
        //Create sequence of actions
        let seq1 = SKAction.sequence([actionGroup1, scaleAction2])
        let seq2 = SKAction.sequence([actionGroup2, scaleAction2])
        
        // Tell the node to execute the action!
        nextButton.runAction(seq1)
        //skipButton.runAction(seq2)
                
        spawnBees()
        
        //For testing, start with level 1
        //NSUserDefaults.standardUserDefaults().setInteger(1, forKey:"Level")
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        var touch = touches as!  Set<UITouch>
        var location = touch.first!.locationInNode(self)
        var node = self.nodeAtPoint(location)
        
        // If next button is touched, start transition to second scene
        if (node.name == "skipButton") {
            var secondScene = Level1Scene(size: self.size)
            var transition = SKTransition.crossFadeWithDuration(0.5)
            secondScene.scaleMode = SKSceneScaleMode.AspectFill
            self.scene!.view?.presentScene(secondScene, transition: transition)
        }
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
