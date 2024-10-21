//
//  EditView.swift
//  HotProspects
//
//  Created by 최정안 on 10/14/24.
//

import SwiftUI
import SwiftData

struct EditView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    var prospect: Prospect
    
    @State private var name: String
    @State private var emailAddress: String
    @State private var isContacted: Bool
    
    init(prospect: Prospect) {
        self.prospect = prospect
        
        _name = State(initialValue: prospect.name)
        _emailAddress = State(initialValue: prospect.emailAddress)
        _isContacted = State(initialValue: prospect.isContacted)
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Email Address", text: $emailAddress)
            Toggle(isOn: $isContacted) {
                Text("Contacted?")
            }
        }
        .navigationTitle("Edit")
        .toolbar {
            Button("Save") {
                prospect.name = name
                prospect.emailAddress = emailAddress
                prospect.isContacted = isContacted
                dismiss()
            }
        }
    }
}

#Preview {
    EditView(prospect: Prospect(name: "example", emailAddress: "example@com", isContacted: false))
}
