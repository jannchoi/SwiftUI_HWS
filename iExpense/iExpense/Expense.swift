//
//  Expense.swift
//  iExpense
//
//  Created by 최정안 on 10/1/24.
//

import Foundation

import SwiftData
@Model
class Expense {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
