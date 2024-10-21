//
//  AddView.swift
//  iExpense
//
//  Created by 최정안 on 9/2/24.
//

import SwiftUI
import SwiftData

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "KRW"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense ")
            .toolbar {
                Button("Save"){
                    let item = Expense(name: name, type: type, amount: amount)
                    modelContext.insert(item)
                    name = ""
                    type = "Business"
                    amount = 0
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView()
}
