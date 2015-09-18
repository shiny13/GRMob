//
//  Level3Scene.swift
//  GR
//
//  Created by Shahnawaz Alam on 18/09/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//
import SpriteKit

class Level3Scene: SKScene {
    
    //MARK: properties
    let world = SKNode()
    
    var quesList : QuestionSetList
    var counter: Int
    var score: Int
    var touch: Int
    var level: Int
    let menuButton = SKSpriteNode (imageNamed: "Menu2.png")
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
    
    //MARK: required constructor
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(size: CGSize) {
        quesList = QuestionSetList(level: 1)
        self.counter = 0
        self.score = 0
        self.touch = 0
        self.level = 1
        
        super.init(size: size)
    }
    
    //MARK: generate the ground
    func generateBackground()
    {
        self.backgroundColor = UIColor(red: 0.29, green: 0.44, blue:
            0.14, alpha: 1.0);
        
        let background = SKSpriteNode(imageNamed: "MapEnvir2-05.png")
        background.position = CGPointMake(self.size.width/2, self.size.height/2)
        background.setScale(0.5)
        background.zPosition = -20
        self.addChild(background)
    }
    
    //MARK: generate all sprites
    
    func generateQuestion()
    {
        self.touch = 0
        print("Counter \(counter)")
        let quesSet: QuestionSet = quesList.questionList[self.counter]
        
        if self.counter == 0 {
            drawLabelSprite(quesSet)
            return
        }
        
        refreshLabels(quesSet)
    }
    
    func generateButton()
    {
        menuButton.position = CGPointMake(self.size.width * 0.05, self.size.height * 0.95)
        menuButton.setScale(0.5)
        self.menuButton.name = "menu"
        self.addChild(menuButton)
        
        nextButton.position = CGPointMake(self.size.width * 0.8, nextButton.size.height * 0.25)
        nextButton.setScale(0.2)
        self.nextButton.name = "next"
        self.addChild(nextButton)
    }
    
    func refreshLabels(qSet: QuestionSet)
    {
        qLabel.text = qSet.question as String
        answer1.text = qSet.answer1.answer as String
        answer2.text = qSet.answer2.answer as String
        scoreLabel.text = "Score: \(score)"
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
        
    }
    
    func generateTipSprite() {
        
        //Spawn the tip
        tipSprite.spawn(world, imageName: "palette.png", zPosition: -4, tip: "The world is in danger")
        tipSprite.runSpawnAction()
        
        
    }
    
    //MARK: method to load scene
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        // Add the world node as a child of the scene
        self.addChild(world)
        self.counter = 0
        self.score = 0
        self.level = 1 //Default value to avoid errors
        
        loadSavedScore()
        loadSavedLevel()
        
        quesList = QuestionSetList(level: level)
        generateBackground()
        //generateGround()
        generateQuestion()
        generateButton()
        generateCheckboxes()
        generateTipSprite()
        
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
    
    func loadSavedLevel() {
        if let key: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("Level"){
            self.level = key as! IntegerLiteralType
            print("Retrieving level: \(level)")
        }
        else {
            // does not exist
            print("Saving level for the 1st time")
            NSUserDefaults.standardUserDefaults().setInteger(self.level, forKey:"Level")
        }
    }
    
    //MARK: Save to NSUserDefaults
    func saveScore(){
        print("Score before transition: \(score)")
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(self.score, forKey: "Score")
        defaults.synchronize()
    }
    
    func saveLevel(){
        print("Level before transition: \(level)")
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(self.level, forKey: "Level")
        defaults.synchronize()
    }
    
    //MARK: Label Effects
    func tryAgainEffect()
    {
        let tryLabel: SKLabelNode = SKLabelNode(fontNamed: "Papyrus")
        tryLabel.text = "Try Again!"
        tryLabel.fontSize = 150
        tryLabel.fontColor = SKColor(red: 0.55, green: 0, blue: 0, alpha: 1)
        tryLabel.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5)
        tryLabel.setScale(0.1)
        self.addChild(tryLabel)
        
        let scaleAction = SKAction.scaleTo(1, duration: 0.6)
        let fadeAway = SKAction.fadeOutWithDuration(2.0)
        let removeNode = SKAction.removeFromParent()
        let sequence = SKAction.sequence([scaleAction, fadeAway, removeNode])
        tryLabel.runAction(sequence)
    }
    
    //MARK: Handle touch events
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches
        let location = touch.first!.locationInNode(self)
        let node = self.nodeAtPoint(location)
        let quesSet: QuestionSet = quesList.questionList[self.counter]
        
        // If next button is touched, start transition to second scene
        if node.name == "check1" {
            self.check1.texture = SKTexture(imageNamed: "checked.png")
            self.check2.texture = SKTexture(imageNamed: "unchecked.png")
            
            if self.touch < 1 && quesSet.answer1.correct == true {
                self.score += 1000
                print("Touch Began Score: \(score)")
            }
            
            self.touch++
            
        }
        
        if node.name == "check2" {
            self.check1.texture = SKTexture(imageNamed: "unchecked.png")
            self.check2.texture = SKTexture(imageNamed: "checked.png")
            
            if self.touch < 1 && quesSet.answer2.correct == true {
                self.score += 1000
                print("Touch Began Score: \(score)")
            }
            
            self.touch++
        }
        
        if node.name == "next" {
            
            self.counter++
            
            print("Count val: \(self.quesList.questionList.count)")
            if counter >= self.quesList.questionList.count {
                saveScore()
                
                if self.level < 4 {
                    self.level++
                    saveLevel()
                    let newScene = BuyItemScene(size: self.size)
                    loadScene(newScene)
                } else {
                    self.level = 1
                    saveLevel()
                    let newScene = GameScene(size: self.size)
                    loadScene(newScene)
                }
                
            }
            else {
                if self.touch < 1 {
                    self.counter--
                    tryAgainEffect()
                    return;
                }
                
                generateQuestion()
                self.check1.texture = SKTexture(imageNamed: "unchecked.png")
                self.check2.texture = SKTexture(imageNamed: "unchecked.png")
            }
        }
        
        if node.name == "menu"
        {
            let newScene = GameScene(size: self.size)
            loadScene(newScene)
        }
        
    }
    
    //Mark: Load Scene
    func loadScene(newScene: SKScene)
    {
        let transition = SKTransition.crossFadeWithDuration(0.5)
        newScene.scaleMode = SKSceneScaleMode.AspectFill
        self.scene!.view?.presentScene(newScene, transition: transition)
    }
    
    //MARK: Simulate physics
    override func didSimulatePhysics() {
        
        let worldYPos:CGFloat = 0
        let worldXPos = -(30 * world.xScale - (self.size.width / 3))
        
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
