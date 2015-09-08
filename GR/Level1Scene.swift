//
//  Level1Scene.swift
//  GR
//
//  Created by Shahnawaz Alam on 1/09/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class Level1Scene: SKScene {
    
    //MARK: properties
    let world = SKNode()
    
    var quesList : QuestionSetList
    var counter: Int
    var score: Int
    var touch: Int
    var level2Bg = SKSpriteNode(imageNamed: "paper1.jpg")
    var nextButton = SKSpriteNode (imageNamed: "arrow.png")
    var check1: SKSpriteNode = SKSpriteNode (imageNamed: "unchecked.png")
    var check2: SKSpriteNode = SKSpriteNode (imageNamed: "unchecked.png")
    var qLabel = SKLabelNode(fontNamed:"Cochin")
    var answer1 = SKLabelNode(fontNamed:"Cochin")
    var answer2 = SKLabelNode(fontNamed:"Cochin")
    var scoreLabel = SKLabelNode(fontNamed: "Thonburi")
    let tipSprite = TipSprite()
    
    //The ground node
    let ground = Ground()
    //Background sprite array
    var backgrounds:[Background] = []
    
    // 2 checkboxes using Checkbox class
    //let checkbox1 = Checkbox()
    //let checkbox2 = Checkbox()
    
    //MARK: required constructor
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(size: CGSize) {
        quesList = QuestionSetList(level: 1)
        self.counter = 0
        self.score = 0
        self.touch = 0
        
        super.init(size: size)
    }
    
    //MARK: generate the ground
    func generateBackground()
    {
        //level2Bg.position = CGPointMake(self.size.width/2, self.size.height/2)
        //self.addChild(level2Bg)
        
        self.backgroundColor = UIColor(red: 0.53, green: 0.81, blue:
            0.98, alpha: 1.0);
        
        //Instantiate the background array
        for i in 0...3 {
            backgrounds.append(Background())
        }
        
        //Spawn the new backgrounds
        backgrounds[0].spawn(world, imageName: "Background-1", zPosition: -5, movementMultiplier: 0.75)
        backgrounds[1].spawn(world, imageName: "Background-2", zPosition: -10, movementMultiplier: 0.5)
        backgrounds[2].spawn(world, imageName: "Background-3", zPosition: -15, movementMultiplier: 0.2)
        backgrounds[3].spawn(world, imageName: "Background-4", zPosition: -20, movementMultiplier: 0.1)
    }
    
    func generateGround() {
        //Setting the ground from outside the screen width
        let groundPosition = CGPoint(x: -self.size.width, y: 100)
        
        let groundSize = CGSize(width: self.size.width * 3, height: 0)
        
        //Spawn the ground
        ground.spawn(world, position: groundPosition, size: groundSize)
    }
    
    //MARK: generate all sprites
    
    func generateQuestion()
    {
        self.touch = 0
        println("Counter \(counter)")
        var quesSet: QuestionSet = quesList.questionList[self.counter]
        
        if self.counter == 0 {
            drawLabelSprite(quesSet)
            return
        }
        
        refreshLabels(quesSet)
    }
    
    func generateButton()
    {
        nextButton.position = CGPointMake(self.size.width * 0.8, nextButton.size.height * 0.25)
        nextButton.setScale(0.2)
        self.nextButton.name = "next"
        self.addChild(nextButton)
    }
    
    func refreshLabels(qSet: QuestionSet)
    {
        qLabel.text = qSet.question as String
        //println("Question: " + qLabel.text)
        answer1.text = qSet.answer1.answer as String
        //println("A1: " + answer1.text)
        answer2.text = qSet.answer2.answer as String
        //println("A2: " + answer2.text)
        scoreLabel.text = "Score: \(score)"
        //println("Score: \(score)")
    }
    
    func drawLabelSprite(quesSet: QuestionSet)
    {
        qLabel.text = quesSet.question as String
        qLabel.fontSize = 40
        qLabel.fontColor = SKColor(red: 0.33, green: 0.42, blue: 0.18, alpha: 1)
        qLabel.position = CGPointMake(self.size.width/2, self.size.height * 0.82)
        self.addChild(qLabel)
        
        //let questionScale = SKAction.scaleTo(1, duration: 1.5)
        //qLabel.runAction(questionScale)
        
        answer1.text = quesSet.answer1.answer as String
        answer1.fontSize = 40
        answer1.fontColor = SKColor(red: 0.33, green: 0.42, blue: 0.18, alpha: 1)
        answer1.position = CGPointMake(self.size.width * 0.35, self.size.height * 0.73)
        self.addChild(answer1)
        
        answer2.text = quesSet.answer2.answer as String
        answer2.fontSize = 40
        answer2.fontColor = SKColor(red: 0.33, green: 0.42, blue: 0.18, alpha: 1)
        answer2.position = CGPointMake(self.size.width * 0.35, self.size.height * 0.63)
        self.addChild(answer2)
        
        scoreLabel.text = "Score: \(score)"
        scoreLabel.fontSize = 30
        scoreLabel.fontColor = SKColor(red: 0.89, green: 0.44, blue: 0.10, alpha: 1)
        scoreLabel.position = CGPointMake(self.size.width * 0.85, self.size.height * 0.95)
        self.addChild(scoreLabel)
    }
    
    func generateCheckboxes()
    {
        self.check1.position = CGPointMake(self.size.width * 0.25, self.size.height * 0.74)
        self.check1.setScale(0.15)
        self.check1.name = "check1"
        self.addChild(self.check1)
        
        self.check2.position = CGPointMake(self.size.width * 0.25, self.size.height * 0.65)
        self.check2.setScale(0.15)
        self.check2.name = "check2"
        self.addChild(self.check2)
        
        //Using the spawn function to draw the sprite to the screen
        /*checkbox1.spawn(world, position: CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.84), size: CGSize(width: 45, height: 45))
        checkbox2.spawn(world, position: CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.75), size: CGSize(width: 45, height: 45))
        
        checkbox1.name = "check1"
        checkbox2.name = "check2"*/
    }
    
    func generateTipSprite() {
        //Setting the tip position
        let tipPosition = CGPoint(x: self.size.width * 0.35, y: 350)
        let tipSize = CGSize(width: 400, height: 300)
        
        //Spawn the tip
        tipSprite.spawn(world, position: tipPosition, size: tipSize)
        tipSprite.runSpawnAction()
    }
    
    //MARK: method to load scene
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        // Add the world node as a child of the scene
        self.addChild(world)
        
        quesList = QuestionSetList(level: 1)
        self.counter = 0
        self.score = 0
        
        generateBackground()
        generateGround()
        generateQuestion()
        generateButton()
        generateCheckboxes()
        generateTipSprite()
        
    }
    
    //MARK: Handle touch events
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        var touch = touches as!  Set<UITouch>
        var location = touch.first!.locationInNode(self)
        var node = self.nodeAtPoint(location)
        
        // If next button is touched, start transition to second scene
        if node.name == "check1" {
            self.check1.texture = SKTexture(imageNamed: "checked.png")
            //var texAction = SKAction.setTexture(SKTexture(imageNamed: "checked.png"))
            //self.check1.runAction(texAction)
            
            self.check2.texture = SKTexture(imageNamed: "unchecked.png")
            //self.check2.runAction(texAction)
            
            //checkbox1.onTap()
            
            //Accumulating free points
            self.score += 1000
            println("Touch Began Score: \(score)")
            
            self.touch++
        }
        
        if node.name == "check2" {
            self.check1.texture = SKTexture(imageNamed: "unchecked.png")
            self.check2.texture = SKTexture(imageNamed: "checked.png")
            
            self.touch++
        }
        
        if node.name == "next" {
            
            self.counter++
            
            println("Count val: \(self.quesList.questionList.count)")
            if counter >= self.quesList.questionList.count {
                
                println("Score before transition: \(score)")
                var secondScene = BuyItemScene(size: self.size)
                var transition = SKTransition.crossFadeWithDuration(1.0)
                secondScene.scaleMode = SKSceneScaleMode.AspectFill
                self.scene!.view?.presentScene(secondScene, transition: transition)
            }
            else {
                if self.touch < 1 {
                    self.counter--
                    return;
                }
                
                generateQuestion()
                self.check1.texture = SKTexture(imageNamed: "unchecked.png")
                self.check2.texture = SKTexture(imageNamed: "unchecked.png")
            }
        }
        
    }
    
    //MARK: Simulate physics
    override func didSimulatePhysics() {
        
        var worldYPos:CGFloat = 0
        var worldXPos = -(30 * world.xScale - (self.size.width / 3))
        
        // Move the world for our adjustment:
        world.position = CGPoint(x: worldXPos, y: worldYPos)
        
        // Position the backgrounds:
        for background in self.backgrounds {
            background.updatePosition()
        }
        
    }
    
    //MARK: Update at time intervals
    override func update(currentTime: NSTimeInterval) {

    }
    
}