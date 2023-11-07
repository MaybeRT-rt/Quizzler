//
//  TrueFalseQuestion.swift
//  Quizzler
//
//  Created by Liz-Mary on 05.11.2023.
//

struct TrueFalseQuestion: QuestionProtocol {
    
    let question: String
    let answer: String
    
    init(q: String, a: String) {
        question = q
        answer = a
    }
    
    func getQuestionText() -> String {
        return question
    }
    
    func getCorrectAnswer() -> String {
        return answer
    }
}
