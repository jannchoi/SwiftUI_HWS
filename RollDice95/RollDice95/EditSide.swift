//
//  EditSide.swift
//  RollDice95
//
//  Created by 최정안 on 10/17/24.
//

import SwiftUI

struct EditSide: View {
    @State private var side = 4
    var body: some View {
        NavigationStack{
            Section{
                Form{
                    TextField("The number of side", value: $side, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
            }.navigationTitle("Edit Side")
                .toolbar {
                    NavigationLink("Start" ) {
                        RollDice(side: $side)
                    }
                }
        }
    }
}

#Preview {
    EditSide()
}
