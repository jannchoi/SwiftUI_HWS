//
//  RollDice.swift
//  RollDice95
//
//  Created by 최정안 on 10/17/24.
//

import SwiftUI

struct RollDice: View {
    @Binding var side: Int
    @State private var timeRemaining = 3
    @State private var showingNumber: Int = 0
    @State private var isRolling = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State private var randomColor: Color = .blue

    @State private var total = UserDefaults.standard.integer(forKey: "total")
    @State private var count = UserDefaults.standard.integer(forKey: "count")

    @Environment(\.presentationMode) var presentationMode
    @State private var roationAngle = 0

    var body: some View {
        VStack {
            Text("Total: \(total)")
                .font(.title2)
            Text("Count: \(count)")
                .font(.title2)
            Spacer()
            ZStack {
                Rectangle()
                    .fill(randomColor)
                    .scaledToFit()
                    .frame(width: 130, height: 130)

                Image(systemName: "square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)

                Text("\(showingNumber)")
                    .font(.largeTitle)
                    .rotation3DEffect(
                        .degrees(Double(roationAngle)),
                         axis: (x: 0.0, y: 1.0, z: 0.0)
                    )

            }
            .onReceive(timer) { time in
                guard isRolling else { return }

                if timeRemaining > 0 {
                    showingNumber = Int.random(in: 1...side)
                    randomColor = Color(
                        red: Double.random(in: 0.3...1),
                        green: Double.random(in: 0.3...1),
                        blue: Double.random(in: 0.3...1)
                    )
                    withAnimation {
                        roationAngle += 360
                    }
                    timeRemaining -= 1
                } else if timeRemaining == 0 {
                    total += showingNumber
                    UserDefaults.standard.set(total, forKey: "total")
                    count += 1
                    UserDefaults.standard.set(count, forKey: "count")
                    isRolling = false
                }
            }
            Spacer()
            HStack {
                Button {
                    reset()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Back")
                        .padding()
                        .background(.red)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                }
                Button {
                    startRoll()
                } label: {
                    Text("Start")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                .sensoryFeedback(.impact, trigger: showingNumber)
            }

        }
        .padding()
    }

    func startRoll() {
        isRolling = true
        timeRemaining = 3
        showingNumber = 0
    }

    func reset() {
        total = 0
        count = 0
        timeRemaining = 3
        showingNumber = 0
        isRolling = false
        randomColor = .white
    }
}


#Preview {
    RollDice(side: .constant(6))
}
