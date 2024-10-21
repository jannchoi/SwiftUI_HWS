//
//  iExpenseApp.swift
//  iExpense
//
//  Created by 최정안 on 9/2/24.
//

import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Expense.self)
    }
}
