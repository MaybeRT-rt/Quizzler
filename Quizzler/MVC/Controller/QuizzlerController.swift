//
//  QuizzlerViewController.swift
//  Quizzler
//
//  Created by Liz-Mary on 05.11.2023.
//

import UIKit

class QuizzlerViewController: UIViewController {
    
    let quizzlerView = QuizzlerView()
    var quizzlerModel = QuizzlerModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Color")
        quizzlerView.delegate = self
        setupUI()
        displayQuestion()
    }
    
    func setupUI() {
        view.addSubview(quizzlerView)
        view.addSubview(quizzlerView.trueFalseStackView)
        
        NSLayoutConstraint.activate([
            quizzlerView.trueFalseStackView.topAnchor.constraint(equalTo:  quizzlerView.questionLabel.bottomAnchor, constant: 100),
            quizzlerView.trueFalseStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quizzlerView.trueFalseStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            quizzlerView.trueFalseStackView.bottomAnchor.constraint(equalTo:  quizzlerView.progressView.topAnchor, constant: -25),
            
            quizzlerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            quizzlerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            quizzlerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            quizzlerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            
            quizzlerView.scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            quizzlerView.scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           
            
            
            quizzlerView.questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quizzlerView.questionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            quizzlerView.questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            quizzlerView.questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            quizzlerView.progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            quizzlerView.progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            quizzlerView.progressView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35),
            
            quizzlerView.footerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quizzlerView.footerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            quizzlerView.footerImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func displayQuestion() {
        quizzlerView.questionLabel.text = quizzlerModel.getQuestionText()
        quizzlerView.progressView.progress = quizzlerModel.getProgress()
        
        quizzlerView.trueButton.backgroundColor = UIColor.clear
        quizzlerView.falseButton.backgroundColor = UIColor.clear
        
    }

}

extension QuizzlerViewController: QuizzlerDelegate {
    
    func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.titleLabel?.text ?? ""
        let correctAnswer = quizzlerModel.currentQuestion().getCorrectAnswer()
        let userGotItRight = quizzlerModel.checkAnswer(userAnswer: userAnswer)


        if userGotItRight {
            sender.backgroundColor = UIColor.green
            quizzlerModel.score += 1
        } else {
            sender.backgroundColor = UIColor.red
        }

        quizzlerModel.nextQuestion()
        let progress = Float(quizzlerModel.questionNumber) / Float(quizzlerModel.trueFalseQuestions.count)
        quizzlerView.progressView.progress = progress
        quizzlerView.scoreLabel.text = "Score: \(quizzlerModel.getScore())/\(quizzlerModel.trueFalseQuestions.count)"
        print(progress)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            self.displayQuestion()
        }
    }
}
