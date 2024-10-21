//
//  ContentView.swift
//  Day19
//
//  Created by 최정안 on 8/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var second = 0.0
    @State private var minute = 0.0
    @State private var hour = 0.0
    
    var calculateSecond: Double {
        return (hour * 3600) + (minute * 60) + second
    }
    var calculateMinute: Double {
        return (hour * 60) + minute + (second/60)
    }
    
    var calculateHours: Double {
        return hour + (minute/60) + (second/3600)
    }
    var body: some View {
        Form {
            Section(header: Text("Input Time ( h, m, s)")) {
                TextField("Hour", value: $hour, format: .number).keyboardType(.decimalPad)
                TextField("Minute", value: $minute, format: .number).keyboardType(.decimalPad)
                TextField("Second", value: $second, format: .number).keyboardType(.decimalPad)
            }
            Section("Calculated Time") {
                Text("Hours : \(calculateHours)")
                Text("Minutes : \(calculateMinute)")
                Text("Second : \(calculateSecond)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
