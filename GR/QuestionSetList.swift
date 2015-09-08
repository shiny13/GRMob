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
                generateLevel2List()
                testList()
            case 3:
                generateLevel3List()
                testList()
            case 4:
                generateLevel4List()
                testList()
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
    
    func generateLevel2List()
    {
        var ans1 = makeAnswer("Yes", boolVal: true)
        var ans2 = makeAnswer("No", boolVal: false)
        var ans3 = makeAnswer("Yes", boolVal: false)
        var ans4 = makeAnswer("No", boolVal: true)
        
        var qs1 = QuestionSet(question: "Is it alright to leave the lights on when you're not home?", answer1: ans3, answer2: ans4)
        questionList.append(qs1)
        
        var qs2 = QuestionSet(question: "Should I use energy saving bulbs?", answer1: ans1, answer2: ans2)
        questionList.append(qs2)
        
        var qs3 = QuestionSet(question: "Should I turn off the heater when I'm going away?", answer1: ans1, answer2: ans2)
        questionList.append(qs3)
        
        var qs4 = QuestionSet(question: "Should I leave the tap open while brushing my teeth?", answer1: ans3, answer2: ans4)
        questionList.append(qs4)
        
        var qs5 = QuestionSet(question: "Should I turn on the the stove just before leaving my house?", answer1: ans3, answer2: ans4)
        questionList.append(qs5)
        
    }
    
    func generateLevel3List()
    {
        var ans1 = makeAnswer("Yes", boolVal: true)
        var ans2 = makeAnswer("No", boolVal: false)
        var ans3 = makeAnswer("Yes", boolVal: false)
        var ans4 = makeAnswer("No", boolVal: true)
        
        var qs1 = QuestionSet(question: "Should I waste as much water as possible?", answer1: ans3, answer2: ans4)
        questionList.append(qs1)
        
        var qs2 = QuestionSet(question: "Should I leave the shower on after a shower?", answer1: ans3, answer2: ans4)
        questionList.append(qs2)
        
        var qs3 = QuestionSet(question: "Should I turn off unused electrical appliances?", answer1: ans1, answer2: ans2)
        questionList.append(qs3)
        
        var qs4 = QuestionSet(question: "Should I cut down all the trees in my garden?", answer1: ans3, answer2: ans4)
        questionList.append(qs4)
        
        var qs5 = QuestionSet(question: "Should I plant some trees in my garden?", answer1: ans1, answer2: ans1)
        questionList.append(qs5)
        
    }
    
    func generateLevel4List()
    {
        var ans1 = makeAnswer("Yes", boolVal: true)
        var ans2 = makeAnswer("No", boolVal: false)
        var ans3 = makeAnswer("Yes", boolVal: false)
        var ans4 = makeAnswer("No", boolVal: true)
        
        var qs1 = QuestionSet(question: "Should I water plants regularly in my garden?", answer1: ans1, answer2: ans2)
        questionList.append(qs1)
        
        var qs2 = QuestionSet(question: "Should I help my neighbour's cat stuck in a tree?", answer1: ans1, answer2: ans2)
        questionList.append(qs2)
        
        var qs3 = QuestionSet(question: "Should I keep any plants in a locked room?", answer1: ans3, answer2: ans4)
        questionList.append(qs3)
        
        var qs4 = QuestionSet(question: "Should I collect recyclable items to throw them in the yellow bin?", answer1: ans1, answer2: ans2)
        questionList.append(qs4)
        
        var qs5 = QuestionSet(question: "Should I not use paper unless I really need it?", answer1: ans1, answer2: ans2)
        questionList.append(qs5)
        
        var qs6 = QuestionSet(question: "Should I use the air conditioner during winter?", answer1: ans3, answer2: ans4)
        questionList.append(qs6)
        
    }

    
    func makeAnswer(str: String, boolVal: Bool) -> Answer
    {
        var answer: Answer = Answer(answer: str, correct: boolVal)
        
        return answer
    }
    
    func testList()
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
