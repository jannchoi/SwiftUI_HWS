//
//  ContentView.swift
//  HabbitTracking
//
//  Created by 최정안 on 9/20/24.
//

import SwiftUI

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var amount = 0
}

@Observable
class Habit {
    var items = [HabitItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    
    @State var habit = Habit()
    @State var showingAdd = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($habit.items, id: \.id) { $item in
                    NavigationLink("\(item.name) : \(item.amount) comlete") {
                        habitView(habit: $item, amount: item.amount)
                    }
                }
                .onDelete(perform: { indexSet in
                    removeElement(at: indexSet)
                })
            }
            .navigationTitle("Habit Tracking")
            .toolbar {
                Button("Add Habit", systemImage: "plus") {
                    showingAdd = true
                }
            }
            .sheet(isPresented: $showingAdd) {
                newHabit(habit: habit)
            }
        }
    }
    
    func removeElement(at offset: IndexSet) {
        habit.items.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
