//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by asmaa gamal  on 29/04/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation
struct QuizBrain{
    var score = 0

    let quizes = [Quiz(question: "Four + Two is equal to six ?", answer:"True") , Quiz(question: "Three - one is gretter than five ?", answer: "False") , Quiz(question: "seven  is an odd number ?", answer: "True")]
    var questionNumber = 0
    mutating func checkAnswer(_ userAnswer:String)->Bool{
        if quizes[questionNumber].answer == userAnswer{
            self.score+=1
            return true
            
        }else{
          return false
        }
    }
    func getQuestionText()->String{
        return quizes[questionNumber].question
    }
    func getProgress()->Float{
        return Float(questionNumber + 1 ) / Float(quizes.count)
    }
    mutating func headToTheNextQuestion(){
        
        if questionNumber < quizes.count - 1 {
            questionNumber+=1
           
        }else{
            questionNumber = 0
            score = 0
            }
    }
    
    func getScore()->Int{
        return score
    }

}

