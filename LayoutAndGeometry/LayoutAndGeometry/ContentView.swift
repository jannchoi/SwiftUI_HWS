//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by 최정안 on 10/16/24.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        let minY = proxy.frame(in: .global).minY
                        
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: minY/fullView.size.height, saturation: 0.7, brightness: 0.7))
                            .opacity(
                                minY < 200 ?
                            Double(max(0, 1 - (200 - minY) / 200)) : 1)
                            .scaleEffect(min(0.5, (minY / fullView.size.height)) + 0.2)
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
