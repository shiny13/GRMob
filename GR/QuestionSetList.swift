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
                testLevel1List()
            default:
                println("Make a decision already!")
        }
    }
    
    func generateLevel1List()
    {
        var ans1 = makeAnswer("True", boolVal: true)
        var ans2 = makeAnswer("False", boolVal: false)
        var qs1 = QuestionSet(question: "Do you use the yellow bin to throw away paper?", answer1: ans1, answer2: ans2)
        questionList.append(qs1)
        
        var qs2 = QuestionSet(question: "Do you use the yellow bin to throw away cans?", answer1: ans1, answer2: ans2)
        questionList.append(qs2)
        
        var qs3 = QuestionSet(question: "Do you use the yellow bin to throw away plastic bottles?", answer1: ans1, answer2: ans2)
        questionList.append(qs3)
        
        var qs4 = QuestionSet(question: "Do you use the yellow bin to throw paper bags?", answer1: ans1, answer2: ans2)
        questionList.append(qs4)
        
    }
    
    func makeAnswer(str: String, boolVal: Bool) -> Answer
    {
        var answer: Answer = Answer(answer: str, correct: boolVal)
        
        return answer
    }
    
    func testLevel1List()
    {
        println("Test method for Level 1 questions")
        /*for item in questionList {
            println("Q: " + item.question + " A1: " + item.answer1.answer + " A2: " + item.answer2.answer)
            
        }*/
        
        for i in 0...3 {
            println("Q: " + questionList[i].question +
                " A1: " + questionList[i].answer1.answer +
                " A2: " + questionList[i].answer2.answer)
        }
    }
}
