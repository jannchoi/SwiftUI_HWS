//
//  friend60App.swift
//  friend60
//
//  Created by 최정안 on 10/4/24.
//

import SwiftUI
import SwiftData

@main
struct friend60App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
