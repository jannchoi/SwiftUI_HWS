//
//  ContentView.swift
//  RollDice95
//
//  Created by 최정안 on 10/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    EditSide()
                } label: {
                    Image(systemName: "dice")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
