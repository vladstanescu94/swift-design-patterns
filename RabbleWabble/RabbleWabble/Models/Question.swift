//
//  Question.swift
//  RabbleWabble
//
//  Created by Vlad Stanescu on 19.01.2021.
//

import Foundation

public class Question: Codable {
    public let answer: String
    public let hint: String?
    public let prompt: String
    
    public init(answer: String, hint: String?, prompt: String) {
        self.answer = answer
        self.hint = hint
        self.prompt = prompt
    }
}
