//
//  SequentialQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Vlad Stanescu on 26.01.2021.
//

public class SequentialQuestionStrategy: BaseQuestionStrategy {
    
    public convenience init(questionGroupCaretaker: QuestionGroupCaretaker) {
        let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
        let questions = questionGroup.questions
        self.init(questionGroupCaretaker: questionGroupCaretaker, questions: questions)
    }
}
