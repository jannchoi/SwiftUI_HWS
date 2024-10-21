//
//  BookwormApp.swift
//  Bookworm
//
//  Created by 최정안 on 9/27/24.
//
import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
