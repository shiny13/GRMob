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
    var level: Int
    var correctAnswers: Int = 0
    var correct: Bool = false
    let menuButton = SKSpriteNode (imageNamed: "Menu2.png")
    var nextButton = SKSpriteNode (imageNamed: "arrow.png")
    var check1: SKSpriteNode = SKSpriteNode (imageNamed: "unchecked.png")
    var check2: SKSpriteNode = SKSpriteNode (imageNamed: "unchecked.png")
    var check3: SKSpriteNode = SKSpriteNode (imageNamed: "unchecked.png")
    var check4: SKSpriteNode = SKSpriteNode (imageNamed: "unchecked.png")
    var counterHolder = [SKSpriteNode]()
    var spriteEffects = [SKSpriteNode]()
    var qLabel = SKLabelNode(fontNamed:"Helvetica")
    var answer1 = SKLabelNode(fontNamed:"Helvetica")
    var answer2 = SKLabelNode(fontNamed:"Helvetica")
    var answer3 = SKLabelNode(fontNamed:"Helvetica")
    var answer4 = SKLabelNode(fontNamed:"Helvetica")
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
        self.backgroundColor = UIColor(red: 0, green: 0.96, blue:
            1.0, alpha: 1.0);
        
        let background = SKSpriteNode(imageNamed: "MapEnvir1-11.png")
        background.position = CGPointMake(self.size.width/2, self.size.height/2)
        background.setScale(0.5)
        background.zPosition = -20
        self.addChild(background)
    }
    
    //MARK: Generate Labels
    func refreshLabels(qSet: QuestionSet)
    {
        tipSprite.changeTip(qSet.tip)
        qLabel.text = qSet.question as String
        answer1.text = qSet.answer1.answer as String
        answer2.text = qSet.answer2.answer as String
        answer3.text = qSet.answer3.answer as String
        answer4.text = qSet.answer4.answer as String
        scoreLabel.text = "Score: \(score)"
        counterFadeAction()
    }
    
    func drawLabelSprite(quesSet: QuestionSet)
    {
        tipSprite.changeTip(quesSet.tip)
        
        qLabel.text = quesSet.question as String
        qLabel.fontSize = 25
        qLabel.fontColor = SKColor(red: 0, green: 0, blue: 0.2, alpha: 1)
        qLabel.position = CGPointMake(self.size.width/2, self.size.height * 0.89)
        self.addChild(qLabel)
        
        //let questionScale = SKAction.scaleTo(1, duration: 1.5)
        //qLabel.runAction(questionScale)
        
        answer1.text = quesSet.answer1.answer as String
        answer1.fontSize = 25
        answer1.fontColor = SKColor(red: 0, green: 0, blue: 0.2, alpha: 1)
        
        answer1.position = CGPointMake(self.size.width * 0.45, self.size.height * 0.83)
        self.addChild(answer1)
        
        answer2.text = quesSet.answer2.answer as String
        answer2.fontSize = 25
        answer2.fontColor = SKColor(red: 0, green: 0, blue: 0.2, alpha: 1)
        answer2.position = CGPointMake(self.size.width * 0.45, self.size.height * 0.74)
        self.addChild(answer2)
        
        answer3.text = quesSet.answer3.answer as String
        answer3.fontSize = 25
        answer3.fontColor = SKColor(red: 0, green: 0, blue: 0.2, alpha: 1)
        answer3.position = CGPointMake(self.size.width * 0.45, self.size.height * 0.65)
        self.addChild(answer3)
        
        answer4.text = quesSet.answer4.answer as String
        answer4.fontSize = 25
        answer4.fontColor = SKColor(red: 0, green: 0, blue: 0.2, alpha: 1)
        answer4.position = CGPointMake(self.size.width * 0.45, self.size.height * 0.56)
        self.addChild(answer4)
        
        scoreLabel.text = "Score: \(score)"
        scoreLabel.fontSize = 25
        scoreLabel.fontColor = SKColor(red: 0.21, green: 0.35, blue: 0.42, alpha: 1)
        scoreLabel.position = CGPointMake(self.size.width * 0.85, self.size.height * 0.95)
        self.addChild(scoreLabel)
        
        let wait = SKAction.waitForDuration(1)
        let fadeAction = SKAction.fadeAlphaTo(1, duration: 2)
        
        let seq = SKAction.sequence([wait, fadeAction])
        counterHolder[counter].runAction(seq)
        
    }
    
    //MARK: generate all sprites
    
    func generateQuestion()
    {
        self.correct = false
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
        
        nextButton.position = CGPointMake(self.size.width * 0.9, nextButton.size.height * 0.3)
        nextButton.setScale(0.2)
        self.nextButton.name = "next"
        self.addChild(nextButton)
    }
    
    func generateCheckboxes()
    {
        self.check1.position = CGPointMake(self.size.width * 0.25, self.size.height * 0.84)
        self.check1.setScale(0.15)
        self.check1.name = "check1"
        self.addChild(self.check1)
        
        self.check2.position = CGPointMake(self.size.width * 0.25, self.size.height * 0.75)
        self.check2.setScale(0.15)
        self.check2.name = "check2"
        self.addChild(self.check2)
        
        self.check3.position = CGPointMake(self.size.width * 0.25, self.size.height * 0.66)
        self.check3.setScale(0.15)
        self.check3.name = "check3"
        self.addChild(self.check3)
        
        self.check4.position = CGPointMake(self.size.width * 0.25, self.size.height * 0.57)
        self.check4.setScale(0.15)
        self.check4.name = "check4"
        self.addChild(self.check4)
        
    }
    
    //Mark: Visual Effect Sprite
    func generateEffectSprites()
    {
        let birds = Level1Birds()
        birds.spawn(world, canvasSize: self.size)
        let clouds = Level1Clouds()
        clouds.spawn(world, canvasSize: self.size)
        let grass = Level1Grass()
        grass.spawn(world, canvasSize: self.size)
        let horses = Level1Horses()
        horses.spawn(world, canvasSize: self.size)
        
        spriteEffects = [birds, clouds, grass, horses]
    }
    
    func correctAnswerEffect()
    {
        switch counter
        {
            case 0: let birds:Level1Birds = spriteEffects[counter] as! Level1Birds
                    birds.playCreateAnimation(self.size)
                    break;
            case 1: let clouds:Level1Clouds = spriteEffects[counter] as! Level1Clouds
                    clouds.playCreateAnimation(self.size)
                    break;
            case 2: let grass:Level1Grass = spriteEffects[counter] as! Level1Grass
                    grass.playCreateAnimation(self.size)
                    break;
            case 3: let horses:Level1Horses = spriteEffects[counter] as! Level1Horses
                    horses.playCreateAnimation(self.size)
                    break;
            default: break
        }
    }
    
    func wrongAnswerEffect()
    {
        let wrong = SKSpriteNode (imageNamed: "wrong-answer.png")
        wrong.position = CGPointMake(0 - wrong.size.width, self.size.height * 0.5)
        wrong.setScale(0.75)
        wrong.zPosition = -10
        self.addChild(wrong)
        
        let moveAction = SKAction.moveTo(CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5), duration: 0.75)
        let moveAction2 = SKAction.moveTo(CGPoint(x: self.size.width + wrong.size.width , y: self.size.height * 0.5), duration: 0.75)
        let wait = SKAction.waitForDuration(3.0)
        let seq = SKAction.sequence([moveAction, wait, moveAction2])
        
        wrong.runAction(seq)
        wrong.removeFromParent()
    }
    
    //Mark: Tip Sprite
    func generateTipSprite() {
        
        //Spawn the tip
        tipSprite.spawn(world, imageName: "palette.png", zPosition: -4, tip: "The world is in danger")
        tipSprite.runSpawnAction()
        
    }
    
    //MARK: Question Counter Sprite Methods
    func generateCounterSprite()
    {
        let counterSprite1: SKSpriteNode = SKSpriteNode( imageNamed: "Paper-01.png")
        let counterSprite2: SKSpriteNode = SKSpriteNode( imageNamed: "Paper-01.png")
        let counterSprite3: SKSpriteNode = SKSpriteNode( imageNamed: "Paper-01.png")
        let counterSprite4: SKSpriteNode = SKSpriteNode( imageNamed: "Paper-01.png")
        let counterSprite5: SKSpriteNode = SKSpriteNode( imageNamed: "Paper-01.png")
        
        counterSprite1.position = CGPointMake(self.size.width * 0.15, self.size.height * 0.97)
        counterSprite1.setScale(0.08)
        self.addChild(counterSprite1)
        
        counterSprite2.position = CGPointMake(self.size.width * 0.18, self.size.height * 0.97)
        counterSprite2.setScale(0.08)
        self.addChild(counterSprite2)
        
        counterSprite3.position = CGPointMake(self.size.width * 0.21, self.size.height * 0.97)
        counterSprite3.setScale(0.08)
        self.addChild(counterSprite3)

        counterSprite4.position = CGPointMake(self.size.width * 0.24, self.size.height * 0.97)
        counterSprite4.setScale(0.08)
        self.addChild(counterSprite4)

        counterSprite5.position = CGPointMake(self.size.width * 0.27, self.size.height * 0.97)
        counterSprite5.setScale(0.08)
        self.addChild(counterSprite5)
        
        counterHolder = [counterSprite1, counterSprite2, counterSprite3, counterSprite4, counterSprite5]
        
        let fadeAction = SKAction.fadeAlphaTo(0.2, duration: 0.001)
        counterSprite1.runAction(fadeAction)
        counterSprite2.runAction(fadeAction)
        counterSprite3.runAction(fadeAction)
        counterSprite4.runAction(fadeAction)
        counterSprite5.runAction(fadeAction)
    }
    
    func counterFadeAction()
    {
        let fadeAction = SKAction.fadeAlphaTo(1, duration: 1.25)
        counterHolder[counter].runAction(fadeAction)
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
        generateTipSprite()
        generateCounterSprite()
        generateQuestion()
        generateButton()
        generateCheckboxes()
        generateEffectSprites()
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
            self.check3.texture = SKTexture(imageNamed: "unchecked.png")
            self.check4.texture = SKTexture(imageNamed: "unchecked.png")
            
            if self.touch < 1 && quesSet.answer1.correct == true {
                self.score += 1000
                self.correct = true
                print("Touch Began Score: \(score)")
            }

            self.touch++
            
        }
        
        if node.name == "check2" {
            self.check1.texture = SKTexture(imageNamed: "unchecked.png")
            self.check2.texture = SKTexture(imageNamed: "checked.png")
            self.check3.texture = SKTexture(imageNamed: "unchecked.png")
            self.check4.texture = SKTexture(imageNamed: "unchecked.png")
            
            if self.touch < 1 && quesSet.answer2.correct == true {
                self.score += 1000
                self.correct = true
                print("Touch Began Score: \(score)")
            }

            self.touch++
        }
        
        if node.name == "check3" {
            self.check1.texture = SKTexture(imageNamed: "unchecked.png")
            self.check2.texture = SKTexture(imageNamed: "unchecked.png")
            self.check3.texture = SKTexture(imageNamed: "checked.png")
            self.check4.texture = SKTexture(imageNamed: "unchecked.png")
            
            if self.touch < 1 && quesSet.answer3.correct == true {
                self.score += 1000
                self.correct = true
                print("Touch Began Score: \(score)")
            }
            
            self.touch++
            
        }
        
        if node.name == "check4" {
            self.check1.texture = SKTexture(imageNamed: "unchecked.png")
            self.check2.texture = SKTexture(imageNamed: "unchecked.png")
            self.check3.texture = SKTexture(imageNamed: "unchecked.png")
            self.check4.texture = SKTexture(imageNamed: "checked.png")
            
            if self.touch < 1 && quesSet.answer4.correct == true {
                self.score += 1000
                self.correct = true
                print("Touch Began Score: \(score)")
            }
            
            self.touch++
        }
        
        if node.name == "next" {
            
            if self.correct == true
            {
                correctAnswerEffect()
                playSound(1)
                correctAnswers++
                
            } else {
                wrongAnswerEffect()
                playSound(0)
            }
            
            self.counter++
            
            print("Count val: \(self.quesList.questionList.count)")
            if counter >= self.quesList.questionList.count {
                saveScore()
                endSceneWithEffect()
                
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
                self.check3.texture = SKTexture(imageNamed: "unchecked.png")
                self.check4.texture = SKTexture(imageNamed: "unchecked.png")
            }
        }
        
        if node.name == "menu"
        {
            let newScene = GameScene(size: self.size)
            loadScene(newScene)
        }
        
    }
    
    func playSound(type: Int)
    {
        if type == 0        //Sound for wrong answer
        {
            let correctSound = SKAction.playSoundFileNamed("Sound/Powerup.aif", waitForCompletion: false)
            nextButton.runAction(correctSound)
        }
        else if type == 1   //Sound for correct answer
        {
            let wrongSound = SKAction.playSoundFileNamed("Sound/Hurt.aif", waitForCompletion: false)
            nextButton.runAction(wrongSound)
        }
    }
    
    //Mark: Load Scene
    func loadScene(newScene: SKScene)
    {
        let transition = SKTransition.crossFadeWithDuration(0.5)
        newScene.scaleMode = SKSceneScaleMode.AspectFill
        self.scene!.view?.presentScene(newScene, transition: transition)
    }
    
    //MARK: Next scene with effect
    func endSceneWithEffect()
    {
        let completed = LevelComplete()
        completed.spawn(self, canvasSize: self.size)
        completed.setCorrectQuestion(correctAnswers)
        
        let sound = SKAction.playSoundFileNamed("woohoo.mp3", waitForCompletion: false)
        let moveAction = SKAction.moveTo(CGPoint(x: self.size.width * 0.28, y: self.size.height * 0.3), duration: 0.5)
        let removeLabels = SKAction.runBlock({
            self.removeLabels()
        })
        let groupAction = SKAction.group([moveAction, sound, removeLabels])
        
        let wait = SKAction.waitForDuration(3.5)
        let starAnimation = SKAction.runBlock({
            completed.starAnimation(self.correctAnswers)
        })
        let groupAction2 = SKAction.group([wait, starAnimation])
        
        let transition = SKAction.runBlock({
            let transition = SKTransition.crossFadeWithDuration(0.5)
            let scene = GameScene(size: self.size)
            self.view?.presentScene(scene, transition: transition)
        })
        let moveAction2 = SKAction.moveTo(CGPoint(x: self.size.width + completed.size.width, y: self.size.height * 0.3), duration: 0.5)
        
        let seq = SKAction.sequence([groupAction, groupAction2, moveAction2, transition])
        
        completed.runAction(seq)
    }
    
    //MARK: Remove all labels
    func removeLabels ()
    {
        qLabel.removeFromParent()
        answer1.removeFromParent()
        answer2.removeFromParent()
        answer3.removeFromParent()
        answer4.removeFromParent()
        check1.removeFromParent()
        check2.removeFromParent()
        check3.removeFromParent()
        check4.removeFromParent()
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
