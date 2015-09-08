//
//  Answer.swift
//  GR
//
//  Created by Shahnawaz Alam on 1/09/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import UIKit

class Answer: NSObject {
   
    var answer : String/*{
        get{
            return self.answer
        }
        set(newAnswer){
            self.answer = newAnswer
        }
    }*/
    var correct : Bool/*{
        get{
            return self.correct
        }
        set(newValue){
            self.correct = newValue
        }
    }*/
    
    override init ()
    {
        self.answer = "";
        self.correct = false;
        super.init()
    }
    
    init (answer:String, correct:Bool)
    {
        self.answer = answer as String
        self.correct = correct
        super.init()
    }
    
}
