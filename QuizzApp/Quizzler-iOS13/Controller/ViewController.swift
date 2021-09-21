//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var correctLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        
        if timer != nil {
            timer.invalidate()
        }
        
        
        
         let userAns = sender.currentTitle  // equal to true or false
        
        let userGotItRight = quizBrain.checkAnswer(userAns!)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            correctLabel.textColor = UIColor.green
            correctLabel.text = "You got it!"
            
            
        } else {
            sender.backgroundColor = UIColor.red
            correctLabel.textColor = UIColor.red
            correctLabel.text = "Try again"
        }
        
        quizBrain.nextQuestion()
        
        //updateUI()
        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector:#selector(updateUI), userInfo:nil, repeats: false)
    }
    
    @objc func updateUI() {
        //print(totalTime)
        questionLabel.text = quizBrain.getQuestionText()
        correctLabel.text = ""
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progBar.progress = quizBrain.getProgress()
    }
    
}

