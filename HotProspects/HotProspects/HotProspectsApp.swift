//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by 최정안 on 10/13/24.
//

import SwiftUI
import SwiftData

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
