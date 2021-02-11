//
//  QuestionStrategy.swift
//  RabbleWabble
//
//  Created by Vlad Stanescu on 26.01.2021.
//

public protocol QuestionStrategy: class {
    var title: String { get }
    var correctCount: Int { get }
    var incorrectCount: Int { get }
    
    func advanceToNextQuestion() -> Bool
    func getCurrentQuestion() -> Question
    func markQuestionCorrect(_ question: Question)
    func markQuestionIncorrect(_ question: Question)
    func getQuestionIndexTitle() -> String
}
