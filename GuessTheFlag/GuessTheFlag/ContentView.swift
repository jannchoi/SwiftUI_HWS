//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 최정안 on 8/15/24.
//

import SwiftUI


struct FlagImage: View {
    var countyName: String
    
    var body: some View {
        Image(countyName)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}
struct BlueFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func blueFont() -> some View {
        self.modifier(BlueFont())
    }
}

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany","Ireland", "Italy","Nigeria","Poland", "Spain", "UK", "Ukraine","US"].shuffled()
    
    @State private var correctAnswer = Int.random(in:0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var userScore = 0
    @State private var gameNumber = 1
    @State private var showingFinal = false
    
    @State private var animationAmount = 0.0
    @State private var selectedNumber: Int? = nil
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes. Top stripe blue, middle stripe black, bottom stripe white.",
        "France": "Flag with three vertical stripes. Left stripe blue, middle stripe white, right stripe red.",
        "Germany": "Flag with three horizontal stripes. Top stripe black, middle stripe red, bottom stripe gold.",
        "Ireland": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe orange.",
        "Italy": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe red.",
        "Nigeria": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe green.",
        "Poland": "Flag with two horizontal stripes. Top stripe white, bottom stripe red.",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red.",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background.",
        "Ukraine": "Flag with two horizontal stripes. Top stripe blue, bottom stripe yellow.",
        "US": "Flag with many red and white stripes, with white stars on a blue background in the top-left corner."
    ]
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3)
            ],center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess the Flag")
                    .blueFont()
                    //.font(.largeTitle.bold())
                    //.foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(. semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            withAnimation{
                                selectedNumber = number
                                animationAmount +=  360
                                
                            }
                        } label: {
                            FlagImage(countyName: countries[number])
                                .rotation3DEffect(
                                    .degrees(number == selectedNumber ?  animationAmount: 0),
                                    axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                                .opacity(selectedNumber == nil || selectedNumber == number ? 1.0 : 0.25)  // 선택되지 않은 경우에만 투명도 변경
                                .scaleEffect(selectedNumber == nil || selectedNumber == number ? 1.0 : 0.8)  // 선택되지 않은 경우에만 크기 축소
                            
                        }
                        .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))


                
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: {
                if gameNumber == 9 {
                    showingFinal = true
                } else {
                    askQuestion()
                }
            }
            )
            
            
        } message: {
            Text("Your score is \(userScore)")
        }
        .alert("Game Over", isPresented: $showingFinal){
            Button("Restart", action: reset)
        } message: {
            Text("Your final score is \(userScore)")
        }
    }
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        showingScore = true
        if gameNumber == 8 {
            showingFinal = true
        } else {
            gameNumber += 1
        }
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectedNumber = nil
    }
    func reset() {
        self.userScore = 0
        self.gameNumber = 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectedNumber = nil
        
    }
}

#Preview {
    ContentView()
}
