//
//  QuizzlerModel.swift
//  Quizzler
//
//  Created by Liz-Mary on 05.11.2023.
//

import Foundation

struct QuizzlerModel {
    
    var questionNumber = 0
    var score = 0
    
    enum QuestionType {
        case trueFalse
        case multipleChoice
    }
    
    let trueFalseQuestions: [TrueFalseQuestion] = [
        TrueFalseQuestion(q: "A slug's blood is green.", a: "True"),
        TrueFalseQuestion(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        TrueFalseQuestion(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        TrueFalseQuestion(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        TrueFalseQuestion(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        TrueFalseQuestion(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        TrueFalseQuestion(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        TrueFalseQuestion(q: "Google was originally called 'Backrub'.", a: "True"),
        TrueFalseQuestion(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        TrueFalseQuestion(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        TrueFalseQuestion(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        TrueFalseQuestion(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    
//    func randomQuestion() -> TrueFalseQuestion {
//        let randomIndex = Int.random(in: 0..<trueFalseQuestions.count)
//        return trueFalseQuestions[randomIndex]
//    }
//    
    
    func currentQuestion() -> TrueFalseQuestion {
        return trueFalseQuestions[questionNumber]
    }
    
    func getQuestionText() -> String {
        return currentQuestion().getQuestionText()
    }
    
    func getCorrectAnswer() -> String {
        return currentQuestion().getCorrectAnswer()
    }
    
    func getProgress() -> Float {
        let progress = Float(questionNumber) / Float(trueFalseQuestions.count)
        return progress
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() {
        questionNumber += 1
        if questionNumber >= trueFalseQuestions.count {
            questionNumber = 0 // Сбросить счетчик вопросов после прохождения всех
            resetScore() // Сбросить счетчик очков
        }
    }
    
    func checkAnswer(userAnswer: String) -> Bool {
        return userAnswer == getCorrectAnswer()
    }
    
    mutating func resetScore() {
        questionNumber = 0
        score = 0
    }
}
