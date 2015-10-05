//
//  QuestionSetList.swift
//  GR
//
//  Created by Shahnawaz Alam on 1/09/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import UIKit
import Parse
import Bolts

class QuestionSetList: NSObject {
   
    var questionList = [QuestionSet]()
    var qList = [QuestionSet]()
    
    override init() {
        super.init()
        
    }
    
    init(level: Int)
    {
        super.init()
        
        switch level
        {
            case 1:
                generateLevel1List()
                //retrieveData("Level1")
                randomizer()
                testList()
            case 2:
                generateLevel1List()
                //retrieveData("Level1")
                randomizer()
                testList()
            case 3:
                generateLevel1List()
                //retrieveData("Level1")
                randomizer()
                testList()
            case 4:
                generateLevel1List()
                //retrieveData("Level1")
                randomizer()
                testList()
            default:
                print("Make a decision already!")
        }
    }
    
    func generateLevel1List()
    {
        //Question set 1
        var tip = "Australia has many local collection programs for different types of e-waste including electronic equipment."
        var ans1 = makeAnswer("No way", boolVal: false)
        var ans2 = makeAnswer("Do nothing", boolVal: false)
        var ans3 = makeAnswer("Break them in pieces", boolVal: false)
        var ans4 = makeAnswer("Yes, ofcourse", boolVal: true)
        var ques = "Should electronic waste be recycled?"
        let qs1 = QuestionSet(tip: tip, question: ques, answer1: ans1, answer2: ans2, answer3: ans3, answer4: ans4)
        questionList.append(qs1)
        
        //Question set 2
        tip = "Magazines, catalogs and other materials printed on similar paper should be recycled."
        ans1 = makeAnswer("Throw them in the recycle bin", boolVal: true)
        ans2 = makeAnswer("Do nothing", boolVal: false)
        ans3 = makeAnswer("Make a paper plane", boolVal: false)
        ans4 = makeAnswer("Make a paper boat", boolVal: false)
        ques = "What is the best thing to do with old newspapers?"
        let qs2 = QuestionSet(tip: tip, question: ques, answer1: ans1, answer2: ans2, answer3: ans3, answer4: ans4)
        questionList.append(qs2)
        
        //Question set 3
        tip = "Australia has many collection programs for different types of e-waste including electronic equipment."
        ans1 = makeAnswer("No, collect them", boolVal: false)
        ans2 = makeAnswer("Yes, that's the best solution", boolVal: true)
        ans3 = makeAnswer("Make a pile in the living room", boolVal: false)
        ans4 = makeAnswer("Break them in pieces", boolVal: false)
        ques = "Should mobile phones or computers be recycled?"
        let qs3 = QuestionSet(tip: tip, question: ques, answer1: ans1, answer2: ans2, answer3: ans3, answer4: ans4)
        questionList.append(qs3)
        
        //Question set 4
        tip = "Australia has many collection programs for different types of e-waste including electronic equipment."
        ans1 = makeAnswer("No, collect them", boolVal: false)
        ans2 = makeAnswer("No, break them in pieces", boolVal: false)
        ans3 = makeAnswer("Make a pile in the living room", boolVal: false)
        ans4 = makeAnswer("Yes, ofcourse!", boolVal: true)
        ques = "Should televisions be recycled?"
        let qs4 = QuestionSet(tip: tip, question: ques, answer1: ans1, answer2: ans2, answer3: ans3, answer4: ans4)
        questionList.append(qs4)
        
        //Question set 5
        tip = "Australian’s recycling requirements apply to everyone in the state, in both public and private spaces."
        ans1 = makeAnswer("17 Natural trees", boolVal: true)
        ans2 = makeAnswer("4,100 kilowatt-hours of electricity", boolVal: true)
        ans3 = makeAnswer("Both of these answers", boolVal: true)
        ans4 = makeAnswer("None of these answers", boolVal: false)
        ques = "Recycling 1 ton of paper saves?"
        let qs5 = QuestionSet(tip: tip, question: ques, answer1: ans1, answer2: ans2, answer3: ans3, answer4: ans4)
        questionList.append(qs5)
        
        //Question set 6
        tip = "Turn off lights and all electronics when you leave a room."
        ans1 = makeAnswer("Turn off the lights", boolVal: true)
        ans2 = makeAnswer("Do nothing", boolVal: false)
        ans3 = makeAnswer("I live in the classroom", boolVal: false)
        ans4 = makeAnswer("Say goodbye to everyone", boolVal: false)
        ques = "What should you do when leaving your classroom?"
        let qs6 = QuestionSet(tip: tip, question: ques, answer1: ans1, answer2: ans2, answer3: ans3, answer4: ans4)
        questionList.append(qs6)
        
        //Question set 7
        tip = "Turn off lights and all electronics when you leave a room."
        ans1 = makeAnswer("Leave it open", boolVal: false)
        ans2 = makeAnswer("Close it immediately", boolVal: true)
        ans3 = makeAnswer("Put my cat inside it", boolVal: false)
        ans4 = makeAnswer("Start eating", boolVal: false)
        ques = "What to do when the refrigerator door is open?"
        let qs7 = QuestionSet(tip: tip, question: ques, answer1: ans1, answer2: ans2, answer3: ans3, answer4: ans4)
        questionList.append(qs7)
        
        //Question set 8
        tip = "Turn off lights and all electronics when you leave a room."
        ans1 = makeAnswer("Start playing", boolVal: false)
        ans2 = makeAnswer("Turn everything off", boolVal: false)
        ans3 = makeAnswer("I don't know", boolVal: false)
        ans4 = makeAnswer("Turn off the unused ones", boolVal: true)
        ques = "What should you do when all the lights are on in your house?"
        let qs8 = QuestionSet(tip: tip, question: ques, answer1: ans1, answer2: ans2, answer3: ans3, answer4: ans4)
        questionList.append(qs8)
        
        //Question set 9
        tip = "Turn off lights and all electronics when you leave a room."
        ans1 = makeAnswer("Yes it does", boolVal: true)
        ans2 = makeAnswer("I don't know", boolVal: false)
        ans3 = makeAnswer("I hate stoves", boolVal: false)
        ans4 = makeAnswer("I hate kettles", boolVal: false)
        ques = "Does electric kettle use less energy than the stove?"
        let qs9 = QuestionSet(tip: tip, question: ques, answer1: ans1, answer2: ans2, answer3: ans3, answer4: ans4)
        questionList.append(qs9)
        
        //Question set 10
        tip = "Turn off lights and all electronics when you leave a room."
        ans1 = makeAnswer("I think it's there for fun", boolVal: true)
        ans2 = makeAnswer("How much energy it consumes", boolVal: true)
        ans3 = makeAnswer("I don't know", boolVal: false)
        ans4 = makeAnswer("I never saw it", boolVal: false)
        ques = "What does the energy rating on an appliance mean?"
        let qs10 = QuestionSet(tip: tip, question: ques, answer1: ans1, answer2: ans2, answer3: ans3, answer4: ans4)
        questionList.append(qs10)
        
        //Question set 11
        tip = "Trees produce more oxygen than anything else on earth."
        ans1 = makeAnswer("Complain about them", boolVal: false)
        ans2 = makeAnswer("You should start the same habbit", boolVal: true)
        ans3 = makeAnswer("Run away form them", boolVal: false)
        ans4 = makeAnswer("Set the trees on fire", boolVal: false)
        ques = "If people plant trees in your suburb, you should?"
        let qs11 = QuestionSet(tip: tip, question: ques, answer1: ans1, answer2: ans2, answer3: ans3, answer4: ans4)
        questionList.append(qs11)
        
        //Question set 12
        tip = "Trees produce more oxygen than anything else on earth."
        ans1 = makeAnswer("They absord absorb carbon dioxide", boolVal: true)
        ans2 = makeAnswer("They produce oxygen", boolVal: true)
        ans3 = makeAnswer("Both of these answers", boolVal: true)
        ans4 = makeAnswer("None of these answers", boolVal: false)
        ques = "How are plants important for life on earth?"
        let qs12 = QuestionSet(tip: tip, question: ques, answer1: ans1, answer2: ans2, answer3: ans3, answer4: ans4)
        questionList.append(qs12)
        
        //Question set 13
        tip = "Biodegradable materials can be recycled"
        ans1 = makeAnswer("Plastic bags", boolVal: false)
        ans2 = makeAnswer("Plastic bottles", boolVal: false)
        ans3 = makeAnswer("Both of these answers", boolVal: false)
        ans4 = makeAnswer("None of these answers", boolVal: true)
        ques = "Which of these are biodegradable?"
        let qs13 = QuestionSet(tip: tip, question: ques, answer1: ans1, answer2: ans2, answer3: ans3, answer4: ans4)
        questionList.append(qs13)
        
    }
    
    func makeAnswer(str: String, boolVal: Bool) -> Answer
    {
        let answer: Answer = Answer(answer: str, correct: boolVal)
        
        return answer
    }
    
    func readFile(fileName: String)
    {
        if let input = NSFileHandle(forReadingAtPath: "/Users/shahnawaz/Desktop/level1.txt")
        //if let input = NSBundle.mainBundle().pathForResource(fileName, ofType:"txt")
        {
            let scanner = StreamScanner(source: input, delimiters: NSCharacterSet(charactersInString: ":\n"))
            
            print("Input from text file:")
            var num: Int = 1
            var tip: String = ""
            var question: String = ""
            var ansText: String = ""
            var ans1: Answer = Answer()
            var ans2: Answer = Answer()
            var ans3: Answer = Answer()
            var ans4: Answer = Answer()
            
            while let line: String = scanner.read()
            {
                switch (num)
                {
                case 1: tip = line
                    break
                case 2: question = line
                    break
                case 3: ansText = line
                    break
                case 4: if (line == "true"){
                    ans1 = makeAnswer(ansText, boolVal: true)
                } else if (line == "false") {
                    ans1 = makeAnswer(ansText, boolVal: false)
                }
                    break
                case 5: ansText = line
                    break
                case 6: if (line == "true"){
                    ans2 = makeAnswer(ansText, boolVal: true)
                } else if (line == "false") {
                    ans2 = makeAnswer(ansText, boolVal: false)
                }
                    break
                case 7: ansText = line
                    break
                case 8: if (line == "true"){
                    ans3 = makeAnswer(ansText, boolVal: true)
                } else if (line == "false") {
                    ans3 = makeAnswer(ansText, boolVal: false)
                }
                    break
                case 9: ansText = line
                    break
                case 10: if (line == "true"){
                    ans4 = makeAnswer(ansText, boolVal: true)
                } else if (line == "false") {
                    ans4 = makeAnswer(ansText, boolVal: false)
                }
                    break
                default:
                    break
                }
                
                num++
                if num > 10{
                    let qs = QuestionSet(tip: tip, question: question, answer1: ans1, answer2: ans2, answer3: ans3, answer4: ans4)
                    questionList.append(qs)
                    num = 1
                }
            }
        }
        
    }
    
    func testList()
    {
        print("Test method for Level 1 questions")
        
        for i in 0...3 {
            print("T:" + questionList[i].tip +
                " Q: " + questionList[i].question +
                " A1: " + questionList[i].answer1.answer +
                " A2: " + questionList[i].answer2.answer +
                " A3: " + questionList[i].answer3.answer +
                " A3: " + questionList[i].answer4.answer)
        }

    }
    
    func retrieveData(className: String)
    {
        // 1
        let query = PFQuery(className: className)
        // 3
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                print("Successfully retrieved: \(objects)")
                
                for object in objects!
                {
                    let tip = object["Tip"] as! String
                    let ques = object["Question"] as! String
                    print("Ans \(tip) Ques \(ques)")
                    var ansStr = object["Answer1"] as! String
                    var boolVal = object["Bool1"] as! Bool
                    let ans1 = self.makeAnswer(ansStr, boolVal: boolVal)
                    ansStr = object["Answer2"] as! String
                    boolVal = object["Bool2"] as! Bool
                    let ans2 = self.makeAnswer(ansStr, boolVal: boolVal)
                    ansStr = object["Answer3"] as! String
                    boolVal = object["Bool3"] as! Bool
                    let ans3 = self.makeAnswer(ansStr, boolVal: boolVal)
                    ansStr = object["Answer4"] as! String
                    boolVal = object["Bool4"] as! Bool
                    let ans4 = self.makeAnswer(ansStr, boolVal: boolVal)
                    let qs = QuestionSet(tip: tip, question: ques, answer1: ans1, answer2: ans2, answer3: ans3, answer4: ans4)
                    self.questionList.append(qs)
                }
                
            } else {
                print("Error: \(error)")
            }
        }
    }
    
    func randomizer()
    {
        var i = 0
        while (i < 5)
        {
            let qs = questionList[randomNumber()] as QuestionSet
            qList.append(qs)
            i++
        }
    }
    
    func randomNumber(range: Range<Int> = 1...13) -> Int {
        let min = range.startIndex
        let max = range.endIndex
        return Int(arc4random_uniform(UInt32(max - min))) + min
    }
}
