//
//  ContentView.swift
//  edutainment
//
//  Created by 최정안 on 8/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var mulTable = 2
    @State private var questionOptions = [5, 10, 20]
    @State private var questionNum = 5
    @State private var currentNum = Int.random(in: 2...12)
    @State private var useranswer = ""
    @State private var gameNum = 0
    
    @State private var answerTitle = ""
    @State private var showAnswer = false
    
    @State private var showFinal = false
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Select the table") {
                    Stepper("\(mulTable.formatted())", value: $mulTable, in: 2...12, step: 1)
                }
                
                Section("How many questions?") {
                    Picker("questions", selection: $questionNum) {
                        ForEach(questionOptions, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                
                VStack {
                    Text("\(mulTable) X \(currentNum) = ?")
                        .font(.headline)
                        .padding()
                    
                    TextField("Your answer: ", text: $useranswer)
                        .keyboardType(.numberPad)
                        .padding()
                    
                    Button("Check the answer") {
                        gameSet(useranswer)
                    }
                    .padding()
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(10)
                    
                    Text("Left Questions: \(questionNum - gameNum)")
                        .font(.subheadline)
                        .padding(.top)
                }
            }
            .navigationBarTitle("Multiplication Game")
            .alert(answerTitle, isPresented: $showAnswer) {
                Button("Continue", action: {
                    if gameNum == questionNum {
                        showFinal = true
                    } else {
                        askQuestion()
                    }
                })
            }
            .alert("Game Over \n Set the table Question Number", isPresented: $showFinal) {
                Button("Restart", action: reset)
            }
        }
    }
                   
    func gameSet(_ n: String) {
        if let userAnswerInt = Int(useranswer), userAnswerInt == (mulTable * currentNum) {
            answerTitle = "You are right!"
        } else {
            answerTitle = "You are wrong\nThe answer is \(mulTable * currentNum)"
        }
        showAnswer = true
        
        if gameNum == questionNum {
            showFinal = true
        } else {
            gameNum += 1
        }
    }
    
    func askQuestion() {
        currentNum = Int.random(in: 1...12)
    }
    
    func reset() {
        currentNum = Int.random(in: 1...12)
        gameNum = 0
    }
}

#Preview {
    ContentView()
}
