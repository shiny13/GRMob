//
//  QuestionSetList.swift
//  GR
//
//  Created by Shahnawaz Alam on 1/09/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import UIKit

class QuestionSetList: NSObject {
   
    var questionList = [QuestionSet]()
    
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
                testList()
            case 2:
                generateLevel1List()
                testList()
            case 3:
                generateLevel1List()
                testList()
            case 4:
                generateLevel1List()
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
        
    }
    
    func makeAnswer(str: String, boolVal: Bool) -> Answer
    {
        let answer: Answer = Answer(answer: str, correct: boolVal)
        
        return answer
    }
    
    func readFile(name: String)
    {
        
        
    }
    
    func testList()
    {
        print("Test method for Level 1 questions")
        /*for item in questionList {
            println("Q: " + item.question + " A1: " + item.answer1.answer + " A2: " + item.answer2.answer)
            
        }*/
        
        for i in 0...3 {
            print("T:" + questionList[i].tip +
                " Q: " + questionList[i].question +
                " A1: " + questionList[i].answer1.answer +
                " A2: " + questionList[i].answer2.answer +
                " A3: " + questionList[i].answer3.answer +
                " A3: " + questionList[i].answer4.answer)
        }
    }
}
