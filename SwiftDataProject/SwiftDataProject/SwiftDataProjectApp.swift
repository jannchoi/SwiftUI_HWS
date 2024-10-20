//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by 최정안 on 9/30/24.
//
import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
