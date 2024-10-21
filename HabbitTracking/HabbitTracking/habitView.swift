//
//  habitView.swift
//  HabbitTracking
//
//  Created by 최정안 on 9/20/24.
//

import SwiftUI

struct habitView: View {
    @Binding var habit: HabitItem
    @State var amount: Int
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Text("\(habit.description)")
                }
                Section{
                    Text("current amount: \(amount)")
                    
                    Button{
                        amount += 1
                        habit.amount += 1
                    } label: {
                        Text("Done Today!")
                    }
                }
                
            }

            .navigationTitle("\(habit.name)")
        }
    }
}

#Preview {
    habitView(habit: .constant(HabitItem(name: "Sample Name", description: "Sample Description")), amount: 0)
}


