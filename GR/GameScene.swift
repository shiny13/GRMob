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
    let bgImage = SKSpriteNode(imageNamed: "signs_of_spring_2-wallpaper-1024x1024.jpg")
    let bgAustralia = SKSpriteNode(imageNamed: "Australia-01.png")
    
    //Button sprites
    let recycle:SKSpriteNode = SKSpriteNode(imageNamed: "RecycleBin-01.png")
    let water:SKSpriteNode = SKSpriteNode(imageNamed: "MrWater-02.png")
    let tree:SKSpriteNode = SKSpriteNode(imageNamed: "mrTree-02.png")
    let paper:SKSpriteNode = SKSpriteNode(imageNamed: "MrPaper-02.png")
    let videoButton: SKSpriteNode = SKSpriteNode(imageNamed: "icon-video.png")
    let skip = SKLabelNode(fontNamed: "Helvetica")
    
    // Video Sprite Node
    var player:AVPlayer?
    var videoNode:SKVideoNode?
    
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
    
    //MARK: Play Video
    func playVideo()
    {
        // play video
        
        if let urlStr = NSBundle.mainBundle().pathForResource("into_main_v3", ofType: "mp4")
        {
            let url = NSURL(fileURLWithPath: urlStr)
            print(url)
            player = AVPlayer(URL: url)
        
            videoNode = SKVideoNode(AVPlayer: player!)
            videoNode?.position = CGPointMake(frame.size.width/2, frame.size.height/2)
            videoNode?.size = CGSize(width: self.size.width, height: self.size.height)
            videoNode?.zPosition = 1
            addChild(videoNode!)
        
            let play = SKAction.runBlock({
                self.videoNode!.play()
            })
            let wait = SKAction.waitForDuration(35)
            let playGroup = SKAction.group([play, wait])
            let remove = SKAction.runBlock({
                self.skip.removeFromParent()
                self.videoNode!.removeFromParent()
            })
            let seq = SKAction.sequence([playGroup, remove])
            videoNode!.runAction(seq)
            
            skip.text = "Skip"
            skip.fontSize = 30
            skip.fontColor = SKColor(red: 1.0, green: 0.96, blue: 0.56, alpha: 1)
            skip.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.1)
            skip.zPosition = 5
            skip.name = "skip"
            self.addChild(skip)
        }
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
        
        videoButton.position = CGPointMake(self.size.width * 0.85, self.size.height * 0.2)
        videoButton.zPosition = -10
        videoButton.setScale(0.5)
        videoButton.name = "video"
        self.addChild(videoButton)

        
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
    
    //MARK: Remove video
    func removeVideo()
    {
        if videoNode!.paused !=  true
        {
            videoNode!.pause()
        }
        videoNode!.removeFromParent()
        skip.removeFromParent()
    }
    
    func saveLevel(level: Int){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(level, forKey: "Level")
        defaults.synchronize()
    }
    
    //Mark: Load Scene
    func loadScene(newScene: SKScene)
    {
        let transition = SKTransition.crossFadeWithDuration(0.5)
        newScene.scaleMode = SKSceneScaleMode.AspectFill
        self.scene!.view?.presentScene(newScene, transition: transition)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches 
        let location = touch.first!.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if (node.name == "video")
        {
            playVideo()
        }
        
        if (node.name == "skip")
        {
            removeVideo()
        }
        
        if (node.name == "tree")
        {
            saveLevel(1)
            let newScene = Level1Scene(size: self.size)
            loadScene(newScene)
        }
        else if (node.name == "paper")
        {
            saveLevel(2)
            let newScene = Level2Scene(size: self.size)
            loadScene(newScene)
        }
        else if (node.name == "water")
        {
            saveLevel(3)
            let newScene = Level3Scene(size: self.size)
            loadScene(newScene)
        }
        else if (node.name == "recycle")
        {
            saveLevel(4)
            let newScene = Level4Scene(size: self.size)
            loadScene(newScene)
        }
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
