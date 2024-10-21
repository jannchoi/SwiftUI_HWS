//
//  UserView.swift
//  friend60
//
//  Created by 최정안 on 10/4/24.
//

import SwiftUI

struct UserView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            ZStack() {
                
                RadialGradient(gradient: Gradient(
                    colors: user.isActive ? 
                    [Color.blue.opacity(0.8),
                    Color.blue.opacity(0.2)] :
                    [Color.gray.opacity(0.8),
                    Color.gray.opacity(0.2)])
                    , center: .center, startRadius: 40, endRadius: 100)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                Text(user.name)
                    .foregroundColor(.white)
                    .font(.title)
            }
            
            VStack(alignment: .leading, spacing: 20) {
                
                ScrollView(.horizontal){
                    HStack{
                        Text("My friends: ")
                            .padding()
                        ForEach(user.friends, id: \.id) { friend in
                            Text(friend.name)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                }
                Text("Company: \(user.company)")
                Text("Email: \(user.email)")
                Text("Address: \(user.address)")
                Text("ME? \(user.about)")
                Text("Tags: \(user.tags.joined(separator: ", "))")
                
            }
            .padding()
        }
    }
}

#Preview {
    UserView(user: User(
        id: "1234",
        isActive: true,
        name: "Test name",
        age: 28,
        company: "Example Corp",
        email: "test.doe@example.com",
        address: "123 Street, City, Country",
        about: "My example story",
        registered: "2024-10-04T00:00:00Z",
        tags: ["swift", "friend"],
        friends: [Friend(
            id: "1c18ccf0-2647-497b-b7b4-119f982e6292",
            name: "Daisy Bond"),
        Friend(
            id: "a1ef63f3-0eab-49a8-a13a-e538f6d1c4f9",
            name: "Tanya Roberson")]
    ))
    .modelContainer(for: User.self)
}
