//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var quizBrain:QuizBrain = QuizBrain()
       @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressView.progress = 0.0
        scoreLabel.text = "score: \(0)"
    }
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let answer = sender.titleLabel?.text ?? ""
        let answerCheck = quizBrain.checkAnswer(answer)
        if answerCheck {
            sender.backgroundColor = UIColor.green
            

        }else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.headToTheNextQuestion()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.updateUI()
        }
    }
    func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressView.progress = quizBrain.getProgress()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "score: \(quizBrain.getScore())"
    }
    
}


