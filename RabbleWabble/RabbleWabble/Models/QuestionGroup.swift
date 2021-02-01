//
//  QuestionGroup.swift
//  RabbleWabble
//
//  Created by Vlad Stanescu on 19.01.2021.
//

import Foundation

public class QuestionGroup {
    
    public class Score: Codable {
        public var correctCount: Int = 0
        public var incorrectCount: Int = 0
        public init() { }
    }
    
    public let questions: [Question]
    public var score: Score
    public let title: String
    
    public init(questions: [Question], score: Score = Score(), title: String) {
        self.questions = questions
        self.score = score
        self.title = title
    }
}
