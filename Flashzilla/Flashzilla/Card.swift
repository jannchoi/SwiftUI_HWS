//
//  Card.swift
//  Flashzilla
//
//  Created by 최정안 on 10/15/24.
//

import Foundation

struct Card: Codable, Identifiable {
    let id: UUID // Challenge 3
    var prompt: String
    var answer: String
    
    static let example = Card(id: UUID() ,prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
