//
//  MissionView.swift
//  Moonshot
//
//  Created by 최정안 on 9/10/24.
//

import SwiftUI

struct RectangleLine: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

struct CrewView: View {
    var crewMember: Astronaut
    var role: String
    
    var body: some View {
        Image(crewMember.id)
            .resizable()
            .frame(width: 104, height: 72)
            .clipShape(.capsule)
            .overlay(
            Capsule()
                .strokeBorder(.white, lineWidth: 1))
                                        
        
        VStack(alignment: .leading) {
            Text(crewMember.name)
                .foregroundStyle(.white)
                .font(.headline)
            Text(role)
                .foregroundStyle(.white.opacity(0.5))
        }
    }
    
}

struct MissionView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) {
                        width,axis in
                        width * 0.6
                    }
                    .accessibilityHidden(true)
                Text("\(mission.launchDate)")
                
                VStack(alignment: .leading) {
                    
                    RectangleLine()
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    RectangleLine()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(crew, id: \.role) { crewMember
                            in
                            NavigationLink {
                                AstronautView(astronaut: crewMember.astronaut)
                            
                            } label: {
                                HStack {
                                    CrewView(crewMember: crewMember.astronaut, role: crewMember.role)
                                }
                                .padding(.horizontal)
                            }
                            .accessibilityElement()
                            .accessibilityLabel("\(crewMember.astronaut.name), role: \(crewMember.role)")
                        }
                    }
                }
                
            }
            .accessibilityElement()
            .accessibilityLabel("\(mission.description)")
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String:Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
