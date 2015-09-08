//
//  BuyItemScene.swift
//  GR
//
//  Created by Shahnawaz Alam on 31/08/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class BuyItemScene: SKScene {
    //MARK: Properties
    let world = SKNode()
    
    var nextButton1 = SKSpriteNode (imageNamed: "arrow.png")
    var bg = SKSpriteNode(imageNamed: "buybg.jpg")
    let buyLabel = SKLabelNode(fontNamed:"Futura")
    var solarPanel = SKSpriteNode(imageNamed: "solarPanel.jpg")
    var windMill = SKSpriteNode(imageNamed: "solarPanel.jpg")
    var energyBulbs = SKSpriteNode(imageNamed: "solarPanel.jpg")
    var trees = SKSpriteNode(imageNamed: "solarPanel.jpg")
    var parks = SKSpriteNode(imageNamed: "solarPanel.jpg")
    var cycles = SKSpriteNode(imageNamed: "solarPanel.jpg")
    
    func drawBackground()
    {
        bg.position = CGPointMake(self.size.width/2, self.size.height/2)
        self.addChild(bg)
    }
    
    func drawLabel()
    {
        buyLabel.text = "Buy an Item";
        buyLabel.fontSize = 65;
        buyLabel.fontColor = SKColor(red: 0.49, green: 0.80, blue: 0.49, alpha: 1)
        buyLabel.position = CGPointMake(self.size.width/2, self.size.height * 0.9)
        self.addChild(buyLabel)
    }
    
    func drawItems()
    {
        solarPanel.position = CGPointMake(self.size.width * 0.25, self.size.height * 0.75)
        solarPanel.setScale(0.4)
        self.addChild(solarPanel)
        
        windMill.position = CGPointMake(self.size.width * 0.75, self.size.height * 0.75)
        windMill.setScale(0.4)
        self.addChild(windMill)
        
        energyBulbs.position = CGPointMake(self.size.width * 0.25, self.size.height * 0.5)
        energyBulbs.setScale(0.4)
        self.addChild(energyBulbs)
        
        trees.position = CGPointMake(self.size.width * 0.75, self.size.height * 0.5)
        trees.setScale(0.4)
        self.addChild(trees)
        
        parks.position = CGPointMake(self.size.width * 0.25, self.size.height * 0.25)
        parks.setScale(0.4)
        self.addChild(parks)
        
        cycles.position = CGPointMake(self.size.width * 0.75, self.size.height * 0.25)
        cycles.setScale(0.4)
        self.addChild(cycles)
    }
    
    func generateButton()
    {
        nextButton1.position = CGPointMake(self.size.width * 0.95, nextButton1.size.height * 0.15)
        nextButton1.setScale(0.1)
        self.nextButton1.name = "next1"
        self.addChild(nextButton1)
    }
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.addChild(world)
        
        generateButton()
        //drawBackground()
        drawLabel()
        drawItems()
    }
    
    //MARK: Handle touch events
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        var touch = touches as!  Set<UITouch>
        var location = touch.first!.locationInNode(self)
        var node = self.nodeAtPoint(location)
        
        if node.name == "next1" {
            
            var newScene = Level2Scene(size: self.size)
            var transition = SKTransition.crossFadeWithDuration(1.0)
            newScene.scaleMode = SKSceneScaleMode.AspectFill
            self.scene!.view?.presentScene(newScene, transition: transition)

        }
        
    }


}