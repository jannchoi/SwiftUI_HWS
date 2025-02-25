//
//  ContentView.swift
//  Navigation
//
//  Created by 최정안 on 9/13/24.
//

import SwiftUI


struct ContentView: View {

    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello world!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)

                
        }
    }
}

#Preview {
    ContentView()
}
