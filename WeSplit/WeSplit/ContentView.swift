//
//  ContentView.swift
//  WeSplit
//
//  Created by 최정안 on 2024/08/09.
//

import SwiftUI

struct ContentView: View {

    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
            
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople+2)// 인덱스가 0부터 시작하기 때문에+2
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    

    var body: some View {

        Form {
            Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: "USD")).keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                Picker("Number of people", selection: $numberOfPeople) { ForEach(2..<100) {
                    Text("\($0) people")
                }}

            }
            Section("How much do you want to tip? "){
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(tipPercentages, id: \.self) {
                        Text($0, format: .percent)
                            .foregroundColor($0 == 0 ? .red : .black)
                    }
                }
                .pickerStyle(.segmented)
            }
            Section {
                Text(totalPerPerson, format: .currency(code: "USD"))
            }
        }
        .toolbar {
            if amountIsFocused {
                Button("Done") {
                    amountIsFocused = false
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
