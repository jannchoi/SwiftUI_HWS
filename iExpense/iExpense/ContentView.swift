//
//  ContentView.swift
//  iExpense
//
//  Created by 최정안 on 9/2/24.
//

import SwiftData
import SwiftUI

struct CustomFont: ViewModifier {

    let amount: Double

    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(amount < 10 ? Color.green : amount < 100 ? Color.blue : Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding()
    }
}
extension View {
    func customFont(amount: Double) -> some View {
        self.modifier(CustomFont(amount: amount))
    }
}


struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query (sort: \Expense.amount)var expenses: [Expense]
    
    @State private var showingAddExpense = false
    
    @State private var title = "Expense"
    
    @State private var filterType: String? = nil

    
    var body: some View {
        NavigationStack{
            List{
                ForEach(filteredExpenses){ expense in
                    Section {
                        HStack{
                            VStack(alignment: .leading){
                                Text(expense.name)
                                    .font(.headline)
                                Text(expense.type)
                            }
                            Spacer()
                            Text(expense.amount, format: .currency(code: "KRW"))
                                .customFont(amount: expense.amount)
                            }
                        .accessibilityElement()
                        .accessibilityLabel("\(expense.name), \(expense.amount, format: .currency(code: "KRW"))")
                        .accessibilityHint("The type is \(expense.type)")
                    }
                }.onDelete(perform: deleteExpense)
            }
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    NavigationLink(destination: AddView()) {
                        Label("Add Expense", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .topBarTrailing)
                {
                    Menu("Filter") {
                        Button("Show All") {
                            filterType = nil
                        }
                        Button("Show Business") {
                            filterType = "Business"
                        }
                        Button("Show Personal") {
                            filterType = "Personal"
                        }
                    }
                }
            }
        }
    }
    var filteredExpenses: [Expense]{
        if let filterType = filterType {
            return expenses.filter { $0.type == filterType}
        } else {
            return expenses
        }
    }
    
    func deleteExpense(of offsets: IndexSet){
        for offset in offsets {
            let item = expenses[offset]
            modelContext.delete(item)
        }
    }
}
    
#Preview {
    ContentView()
}
