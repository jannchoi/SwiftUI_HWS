//
//  ContentView.swift
//  RPSgame
//
//  Created by 최정안 on 8/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var options = ["Rock", "Paper","Scissor"]
    
    @State private var appChoice = Int.random(in: 0...2)
    @State private var mission = Bool.random()
    @State private var missionTitle = ""
    @State private var currentState = false
    @State private var showingState = false
    @State private var scoreTitle = ""
    @State private var userscore = 0
    @State private var gameNumber = 1
    @State private var showingFinal = false
    
    var body: some View {
        VStack(spacing: 30){
            Text("Rock Paper Scissor Game!")
                .font(.largeTitle)
            Text(missionTitle)
                .font(.title)
                .foregroundStyle(.blue)
            
            VStack(spacing: 20){
                // App's Choice
                Text(options[appChoice])
                    .padding()
                    .frame(width: 150, height: 100)
                    .background(Color.red)
                    .clipShape(Circle())
                Text("Chose the answer")
                    
                ForEach(options, id:\.self){ choice in
                    Button {// User's Choice
                        chosen(choice)
                            
                    } label: {
                        Text(choice)
                            .padding()
                            .frame(width: 150, height: 100)
                            .background(Color.yellow)
                            .clipShape(Circle())
                            
                    }
                }
            }
            Text("Your score is \(userscore)")
        }
        .onAppear {
            missionUpdate()
        }
        .alert("\(scoreTitle)",isPresented: $showingState ){
            
        }
        .alert("Game Over! Your score is \(userscore)", isPresented: $showingFinal) {
            Button("Restart", action: reset)
        }
    }
    func missionUpdate(){
        appChoice = Int.random(in: 0...2)
        mission = Bool.random()
        missionTitle = mission ? "Win the game" : "Lose the game"
        }
    
    
    func chosen(_ choice: String){
        if mission {//이길떄
            if (appChoice == 0  && choice == "Paper") || (appChoice == 1 && choice == "Scissor") ||
                (appChoice == 2 && choice == "Rock"){
                currentState = true
                userscore += 1}
            else {
                currentState = false
                userscore -= 1}
        } else { // 질떄
            if (appChoice == 0  && choice == "Scissor") || (appChoice == 1 && choice == "Rock") ||
                ( appChoice == 2 && choice == "Paper"){
                currentState = true
                userscore += 1}
            else {
                currentState = false
                userscore -= 1}}
        
        if currentState {
            scoreTitle = "Correct!"
        }
        else {
            scoreTitle = "Wrong!"
        }
        showingState = true
        
        
        if gameNumber == 10 {
            showingFinal = true}
        else {
            gameNumber += 1
            missionUpdate()}
    }
    
    func reset() {
        self.userscore = 0
        self.gameNumber = 1
        missionUpdate()
    }
    
}

#Preview {
    ContentView()
}
