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
    var answer1: Answer
    var answer2: Answer
    
    override init() {
        
        self.question = ""
        self.answer1 = Answer()
        self.answer2 = Answer()
        super.init()

    }
    
    init (question: String, answer1: Answer, answer2: Answer){
        
        self.question = question as String
        self.answer1 = answer1
        self.answer2 = answer2
        
        super.init()
    }
    
}
