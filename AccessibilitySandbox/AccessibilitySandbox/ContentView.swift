//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by 최정안 on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 10
    var body: some View {
        Button("John Fitzgerald Kennedy") {
            print("Button Tapped")
        }
        .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
    }
}

#Preview {
    ContentView()
}
