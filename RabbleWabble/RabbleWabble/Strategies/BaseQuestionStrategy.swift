//
//  BaseQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Vlad Stanescu on 01.02.2021.
//

import Foundation

public class BaseQuestionStrategy: QuestionStrategy {
    
    public var correctCount: Int {
        get { return questionGroup.score.correctCount }
        set { questionGroup.score.correctCount = newValue }
    }
    
    public var incorrectCount: Int {
        get { return questionGroup.score.incorrectCount }
        set { questionGroup.score.incorrectCount = newValue }
    }
    
    private var questionGroupCaretaker: QuestionGroupCaretaker
    
    private var questionGroup: QuestionGroup {
        return questionGroupCaretaker.selectedQuestionGroup
    }
    
    private var questionIndex = 0
    private let questions: [Question]
    
    public init(questionGroupCaretaker: QuestionGroupCaretaker, questions: [Question]) {
        self.questionGroupCaretaker = questionGroupCaretaker
        self.questions = questions
        
        self.questionGroupCaretaker.selectedQuestionGroup.score.reset()
    }
    
    public var title: String {
        return questionGroup.title
    }
    
    public func getCurrentQuestion() -> Question {
        return questions[questionIndex]
    }
    
    public func advanceToNextQuestion() -> Bool {
        try? questionGroupCaretaker.save()
        guard questionIndex + 1 < questions.count else {
            return false
        }
        
        questionIndex += 1
        return true
    }
    
    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    public func markQuestionIncorrect(_ question: Question) {
        incorrectCount -= 1
    }
    
    public func getQuestionIndexTitle() -> String {
        return "\(questionIndex + 1)/\(questions.count)"
    }
}
