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
    
    var score: Int = 0
    var nextButton1 = SKSpriteNode (imageNamed: "arrow.png")
    var bg = SKSpriteNode(imageNamed: "buybg.jpg")
    let buyLabel = SKLabelNode(fontNamed:"Futura")
    var solarPanel = SKSpriteNode(imageNamed: "solarPanel.jpg")
    var windMill = SKSpriteNode(imageNamed: "solarPanel.jpg")
    var energyBulbs = SKSpriteNode(imageNamed: "solarPanel.jpg")
    var trees = SKSpriteNode(imageNamed: "solarPanel.jpg")
    var parks = SKSpriteNode(imageNamed: "solarPanel.jpg")
    var cycles = SKSpriteNode(imageNamed: "solarPanel.jpg")
    var scoreLabel = SKLabelNode(fontNamed: "Thonburi")
    
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
        
        scoreLabel.text = "Score: \(score)"
        scoreLabel.fontSize = 30
        scoreLabel.fontColor = SKColor(red: 0.80, green: 0.89, blue: 0.45, alpha: 1)
        scoreLabel.position = CGPointMake(self.size.width * 0.80, self.size.height * 0.92)
        self.addChild(scoreLabel)
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
    
    //MARK: Load NSUserDefaults values
    func loadSavedScore() {
        if let key: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("Score"){
            self.score = key as! IntegerLiteralType
            print("Retrieving score: \(score)")
        }
        else {
            // does not exist
            print("Saving score for the 1st time")
            NSUserDefaults.standardUserDefaults().setInteger(self.score, forKey:"Score")
        }
    }
    
    //MARK: Save to NSUserDefaults
    func saveScore(){
        print("Score before transition: \(score)")
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(self.score, forKey: "Score")
        defaults.synchronize()
    }
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.addChild(world)
        
        loadSavedScore()
        generateButton()
        //drawBackground()
        drawLabel()
        drawItems()
    }
    
    //MARK: Handle touch events
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches 
        let location = touch.first!.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node.name == "next1" {
            
            let newScene = Level1Scene(size: self.size)
            let transition = SKTransition.crossFadeWithDuration(0.5)
            newScene.scaleMode = SKSceneScaleMode.AspectFill
            self.scene!.view?.presentScene(newScene, transition: transition)

        }
        
    }


}