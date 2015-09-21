//
//  GameScene.swift
//  GR
//
//  Created by Shahnawaz Alam on 31/08/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit
import AVFoundation

class GameScene: SKScene {
    
    // Create the world as a generic SKNode
    let world = SKNode()
    
    let nextButton: SKSpriteNode = SKSpriteNode(imageNamed: "Next.png")
    let skipButton = SKSpriteNode(imageNamed: "skip.png")
    let bgImage = SKSpriteNode(imageNamed: "signs_of_spring_2-wallpaper-1024x1024.jpg")
    let bgAustralia = SKSpriteNode(imageNamed: "Australia-01.png")
    
    //Button sprites
    let recycle:SKSpriteNode = SKSpriteNode(imageNamed: "RecycleBin-01.png")
    let water:SKSpriteNode = SKSpriteNode(imageNamed: "MrWater-02.png")
    let tree:SKSpriteNode = SKSpriteNode(imageNamed: "mrTree-02.png")
    let paper:SKSpriteNode = SKSpriteNode(imageNamed: "MrPaper-02.png")
    
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
    
    func spawnButtons(sprite: SKSpriteNode, width: CGFloat, height: CGFloat, scale: CGFloat, name: String)
    {
        sprite.position = CGPointMake(width, height)
        sprite.name = name
        sprite.zPosition = -5
        sprite.setScale(scale)
        self.addChild(sprite)
    }
    
    func playVideo()
    {
        var tvMaskNode = SKSpriteNode()
        tvMaskNode.size = self.size
        //SKCropNode *cropNode = [SKCropNode node];
        //cropNode.maskNode = tvMaskNode;
        // 3
       /* NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"BookTrailer" ofType:@"m4v"]];
        var fileURL = NSURL(fileURLWithPath: "videos/animation1_v3.mp4")
        var player = [AVPlayer playerWithURL: fileURL];
        // 4
        _videoNode = [[SKVideoNode alloc] initWithAVPlayer:_player];
        _videoNode.size = CGRectInset(frame,frame.size.width * .15,frame.size.height * .27).size;
        _videoNode.position = CGPointMake(-frame.size.width * .1, -frame.size.height * .06);
        // 5
        [cropNode addChild:_videoNode];
        [self addChild:cropNode];
        // 6
        self.position = frame.origin; 
        self.size = frame.size;
        // 7
        _player.volume = 0.0;
        [_videoNode play]; */
    }
    
    override func didMoveToView(view: SKView) {
        
        // Add the world node as a child of the scene
        self.addChild(world)
        
        bgImage.position = CGPointMake(self.size.width/2, self.size.height/2)
        bgImage.zPosition = -15
        self.addChild(bgImage)
        
        bgAustralia.position = CGPointMake(self.size.width/2, self.size.height/2)
        bgAustralia.zPosition = -10
        bgAustralia.setScale(0.4)
        self.addChild(bgAustralia)
        
        /*nextButton.position = CGPointMake(nextButton.size.width/2, nextButton.size.height/2 + 80)
        nextButton.name = "nextButton"
        self.addChild(nextButton)
        
        skipButton.position = CGPointMake(self.size.width/2, skipButton.size.height/2 + 5)
        skipButton.name = "skipButton"
        skipButton.setScale(0.5)
        self.addChild(skipButton)*/
        
        spawnButtons(tree, width: self.size.width * 0.35, height: self.size.height * 0.7, scale: 0.3, name: "tree")
        spawnButtons(paper, width: self.size.width * 0.6, height: self.size.height * 0.7, scale: 0.35, name: "paper")
        spawnButtons(water, width: self.size.width * 0.35, height: self.size.height * 0.4, scale: 0.3, name: "water")
        spawnButtons(recycle, width: self.size.width * 0.6, height: self.size.height * 0.4, scale: 0.2, name: "recycle")
        
        //Create action for the sprite
        //let moveAction = SKAction.moveTo(CGPoint(x: self.size.width/2, y: nextButton.size.height + 80), duration: 5)
        /*let moveAction = SKAction.moveTo(CGPoint(x:self.size.width/2, y:nextButton.size.height/2 + 80), duration: 1.5)
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
        //skipButton.runAction(seq2)*/
                
        spawnBees()
        
        //For testing, start with level 1
        //NSUserDefaults.standardUserDefaults().setInteger(1, forKey:"Level")
    }
    
    func saveLevel(level: Int){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(level, forKey: "Level")
        defaults.synchronize()
    }
    
    func loadLevel1()
    {
        let secondScene = Level1Scene(size: self.size)
        let transition = SKTransition.crossFadeWithDuration(0.5)
        secondScene.scaleMode = SKSceneScaleMode.AspectFill
        self.scene!.view?.presentScene(secondScene, transition: transition)
    }
    
    func loadLevel2()
    {
        let secondScene = Level2Scene(size: self.size)
        let transition = SKTransition.crossFadeWithDuration(0.5)
        secondScene.scaleMode = SKSceneScaleMode.AspectFill
        self.scene!.view?.presentScene(secondScene, transition: transition)
    }
    
    func loadLevel3()
    {
        let secondScene = Level3Scene(size: self.size)
        let transition = SKTransition.crossFadeWithDuration(0.5)
        secondScene.scaleMode = SKSceneScaleMode.AspectFill
        self.scene!.view?.presentScene(secondScene, transition: transition)
    }
    
    func loadLevel4()
    {
        let secondScene = Level4Scene(size: self.size)
        let transition = SKTransition.crossFadeWithDuration(0.5)
        secondScene.scaleMode = SKSceneScaleMode.AspectFill
        self.scene!.view?.presentScene(secondScene, transition: transition)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches 
        let location = touch.first!.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if (node.name == "tree")
        {
            saveLevel(1)
            loadLevel1()
        }
        else if (node.name == "paper")
        {
            saveLevel(2)
            loadLevel2()
        }
        else if (node.name == "water")
        {
            saveLevel(3)
            loadLevel3()
        }
        else if (node.name == "recycle")
        {
            saveLevel(4)
            loadLevel4()
        }
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
