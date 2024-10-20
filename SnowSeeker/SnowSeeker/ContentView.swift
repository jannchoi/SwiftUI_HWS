//
//  ContentView.swift
//  SnowSeeker
//
//  Created by 최정안 on 10/19/24.
//

import SwiftUI

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.deocde("resorts.json")
    
    @State private var favorites = Favorites()
    @State private var searchText = ""
    @State private var orderType: String? = nil
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            resorts
        }else {
            resorts.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
    var sortedResorts: [Resort] {
        let filtered = filteredResorts
        switch orderType {
        case "Alphabetical":
            return filtered.sorted{$0.name < $1.name}
        case "Country":
            return filtered.sorted{$0.country < $1.country}
        default:
            return filtered
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(sortedResorts) {resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(.rect(cornerRadius: 5))
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Menu("Sort") {
                        Button("Default"){
                            orderType = nil
                        }
                        Button("Alphabetical") {
                            orderType = "Alphabetical"
                        }
                        Button("Country") {
                            orderType = "Country"
                        }
                    }
                }
            }
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
        } detail: {
            WelcomeView()
        }
        .environment(favorites)
    }
}

#Preview {
    ContentView()
}
