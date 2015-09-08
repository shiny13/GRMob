//
//  PlayScene.swift
//  GR
//
//  Created by Shahnawaz Alam on 1/09/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class PlayScene: SKScene {
   
    var playBg = SKSpriteNode(imageNamed: "playbg.jpg")
    var playButton = SKSpriteNode (imageNamed: "play.png")
    
    override func didMoveToView(view: SKView) {
        
        playBg.position = CGPointMake(self.size.width/2, self.size.height/2)
        self.addChild(playBg)
        
        let playLabel = SKLabelNode(fontNamed:"Cochin")
        playLabel.text = "Tap on the button to play";
        playLabel.fontSize = 50
        playLabel.fontColor = SKColor(red: 0.9, green: 0.85, blue: 0.2, alpha: 1)
        playLabel.position = CGPointMake(self.size.width/2, self.size.height/2 + (playButton.size.height * 0.25))
        self.addChild(playLabel)

        
        playButton.position = CGPointMake(self.size.width/2, self.size.height/2)
        self.addChild(playButton)
        
        let scaleAction = SKAction.scaleTo(0.4, duration: 1.5)
        playButton.runAction(scaleAction)
    }
    
}
