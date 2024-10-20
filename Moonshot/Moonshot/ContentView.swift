//
//  ContentView.swift
//  Moonshot
//
//  Created by 최정안 on 9/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingList = false
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationStack{
            ScrollView{
                
                if showingList {
                    LazyVStack{
                        ForEach(missions) {
                            mission in
                            NavigationLink(value: mission){
                                HStack{
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                        .accessibilityLabel(mission.displayName)
                                    VStack{
                                        Text(mission.displayName)
                                        Text(mission.formattedLaunchDate)
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                    }
                                    .accessibilityElement(children: .combine)
                                    .accessibilityLabel("\(mission.displayName)Launch date: \(mission.formattedLaunchDate)")
                                }
                                
                            }
                        }
                    }.padding([.horizontal, .bottom])
                }
                
                
                else
                    
                {LazyVGrid(columns: columns) {
                    ForEach(missions) {
                        mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                    .accessibilityHidden(true)
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                .accessibilityElement(children: .combine)
                                .accessibilityLabel("\(mission.displayName)Launch date: \(mission.formattedLaunchDate)")
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            
            .toolbar(content: {
                Button(action: {
                    showingList.toggle()
                }, label: {
                    Text(showingList ? "Show as Grid" : "Show as List")
                })
                .accessibilityHint("Toggles between grid and list view")
            })
            .navigationDestination(for: Mission.self) {
                mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
        }

    }
}

#Preview {
    ContentView()
}
