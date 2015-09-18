//
//  QuestionSet.swift
//  GR
//
//  Created by Shahnawaz Alam on 1/09/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import UIKit

class QuestionSet: NSObject {
   
    var question : String
    var tip: String
    var answer1: Answer
    var answer2: Answer
    var answer3: Answer
    var answer4: Answer
    
    override init() {
        
        self.question = ""
        self.tip = ""
        self.answer1 = Answer()
        self.answer2 = Answer()
        self.answer3 = Answer()
        self.answer4 = Answer()
        
        super.init()

    }
        
    init (tip: String, question: String, answer1: Answer, answer2: Answer, answer3: Answer, answer4: Answer){
        
        self.tip = tip as String
        self.question = question as String
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.answer4 = answer4
        
        super.init()
    }

    
}
