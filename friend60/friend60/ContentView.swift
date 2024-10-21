//
//  ContentView.swift
//  friend60
//
//  Created by 최정안 on 10/4/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]

    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(users){
                        user in
                        NavigationLink{
                            UserView(user: user)
                        } label : {
                            VStack{
                                ZStack{
                                    RadialGradient(gradient: Gradient(
                                        colors: user.isActive ? [Color.blue.opacity(0.8),
                                                                 Color.blue.opacity(0.2)] : [Color.gray.opacity(0.8),
                                                                                             Color.gray.opacity(0.2)]
                                                                     )
                                        , center: .center, startRadius: 20, endRadius: 100)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                    
                                    Text(user.name)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                        .padding()
                                }

                            }
                        }
                        
                    }
                }
            }.navigationTitle("Users")
                .task{
                    await decoded()
                }
        }
    }
    
    func decoded() async{
        
        let urlS = "https://www.hackingwithswift.com/samples/friendface.json"
        
        guard let url = URL(string: urlS)
        else {
            print("Invailed URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            guard let decoded = try? JSONDecoder().decode([User].self, from: data)
                    
            else {
                print("Deocde Error")
                return
            }
            for user in decoded {
                modelContext.insert(user)
            }
        }
        catch{
            print("Invalid Data")
        }

        
    }
    
}

#Preview {
    ContentView()
}
