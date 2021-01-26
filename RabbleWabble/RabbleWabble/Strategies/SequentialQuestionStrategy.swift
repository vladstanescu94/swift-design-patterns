//
//  SequentialQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Vlad Stanescu on 26.01.2021.
//

public class SequentialQuestionStrategy: QuestionStrategy {
    public var correctCount: Int = 0
    public var incorrectCount: Int = 0
    private let questionGroup: QuestionGroup
    private var questionIndex = 0
    
    public init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
    }
    
    public var title: String {
        return questionGroup.title
    }
    
    public func getCurrentQuestion() -> Question {
        return questionGroup.questions[questionIndex]
    }
    
    public func advanceToNextQuestion() -> Bool {
        guard questionIndex + 1 < questionGroup.questions.count else {
            return false
        }
        questionIndex += 1
        return true
    }
    
    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    public func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }
    
    public func getQuestionIndexTitle() -> String {
        return "\(questionIndex + 1)" + "\(questionGroup.questions.count)"
    }
}
