//
//  MultipleChoiceQuestion.swift
//  Quizzler
//
//  Created by Liz-Mary on 05.11.2023.
//

struct MultipleChoiceQuestion: QuestionProtocol {

    let question: String
    let answers: [String]
    let corretcAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        question = q
        answers = a
        corretcAnswer = correctAnswer
    }
    
    func getQuestionText() -> String {
        return question
    }
    
    func getCorrectAnswer() -> String {
        return corretcAnswer
    }
    
}
