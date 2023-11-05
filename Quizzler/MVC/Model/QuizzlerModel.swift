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
    
    let multipleChoiceQuestions: [MultipleChoiceQuestion] = [
        MultipleChoiceQuestion(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        MultipleChoiceQuestion(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        MultipleChoiceQuestion(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        MultipleChoiceQuestion(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        MultipleChoiceQuestion(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        MultipleChoiceQuestion(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        MultipleChoiceQuestion(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        MultipleChoiceQuestion(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        MultipleChoiceQuestion(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        MultipleChoiceQuestion(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    // выбор случайного из массивов
    func randomQuestions() -> QuestionProtocol {
        let randomType = Int.random(in: 0..<2)
        if randomType == 0 {
            let randomIndex = Int.random(in: 0..<trueFalseQuestions.count)
            return trueFalseQuestions[randomIndex]
        } else {
            let randomIndex = Int.random(in: 0..<multipleChoiceQuestions.count)
            return multipleChoiceQuestions[randomIndex]
        }
    }
    
    // возвращает текст текущего случайно выбранного вопроса
    func getQuestionsText() -> String {
        return randomQuestions().getQuestionText()
    }
    
    // возвращает правильный ответ для текущего вопроса
    func getCorrectAnswer() -> String {
        return randomQuestions().getCorrectAnswer()
    }
    
    //процент прогресса игры
    func getProcess() -> Float {
        return Float(questionNumber) / Float(trueFalseQuestions.count + multipleChoiceQuestions.count)
    }
    
    // переход к след вопросу
    mutating func nextQuestion() {
        questionNumber = (questionNumber + 1) % (trueFalseQuestions.count + multipleChoiceQuestions.count)
    }
    
    // проверка ответа юзера с правильным
    mutating func checkAnswer(userAnswer: String) -> Bool {
        return userAnswer == getCorrectAnswer()
    }
}

