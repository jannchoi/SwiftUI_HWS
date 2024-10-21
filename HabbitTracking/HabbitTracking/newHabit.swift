//
//  newHabit.swift
//  HabbitTracking
//
//  Created by 최정안 on 9/20/24.
//

import SwiftUI

struct newHabit: View {
    var habit: Habit
    @State var name = ""
    @State var description = ""
    var body: some View {
        NavigationStack{
            Form {
                Section{
                    TextField("Name: ",text: $name)
                }
                Section{
                    TextField("Description: ", text: $description)
                }
            }
            .navigationTitle("New Habit")
            .toolbar {
                Button{
                    habit.items.append(HabitItem(name: name, description: description))
                } label:{
                    Text("Save")
                }
            }
        }
    }
}

#Preview {
    newHabit(habit: Habit())
}
