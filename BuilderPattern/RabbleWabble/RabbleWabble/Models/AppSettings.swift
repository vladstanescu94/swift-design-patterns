//
//  AppSettings.swift
//  RabbleWabble
//
//  Created by Vlad Stanescu on 27.01.2021.
//

import Foundation

public class AppSettings {
    public static let shared = AppSettings()
    
    private struct Keys {
        static let questionStrategy = "questionStrategy"
    }
    
    private let userDefaults = UserDefaults.standard
    
    public var questionStrategyType: QuestionStrategyType {
        get {
            let rawValue = userDefaults.integer(forKey: Keys.questionStrategy)
            return QuestionStrategyType(rawValue: rawValue)!
        } set {
            userDefaults.set(newValue.rawValue, forKey: Keys.questionStrategy)
        }
    }
    
    private init() { }
    
    public func getQuestionStrategy(for questionGroupCaretaker: QuestionGroupCaretaker) -> QuestionStrategy {
        return questionStrategyType.getQuestionStrategy(for: questionGroupCaretaker)
    }
}

public enum QuestionStrategyType: Int, CaseIterable {
    case random
    case sequential
    
    public func getTitle() -> String {
        switch self {
        case .random:
            return "Random"
        case .sequential:
            return "Sequential"
        }
    }
    
    public func getQuestionStrategy(for questionGroupCaretaker: QuestionGroupCaretaker) -> QuestionStrategy {
        switch self {
        case .random:
            return RandomQuestionStrategy(questionGroupCaretaker: questionGroupCaretaker)
        case .sequential:
            return SequentialQuestionStrategy(questionGroupCaretaker: questionGroupCaretaker)
        }
    }
}
