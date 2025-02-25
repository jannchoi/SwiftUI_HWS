//
//  EditView.swift
//  BucketList
//
//  Created by 최정안 on 10/8/24.
//

import SwiftUI

struct EditView: View {
    
    @Environment(\.dismiss) var dismiss
    var onSave: (Location) -> Void
    
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Place name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section {
                    switch viewModel.loadingState {
                    case .loading:
                        Text("Loading..")
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) {
                            page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = viewModel.location
                    newLocation.id = UUID()
                    newLocation.name = viewModel.name
                    newLocation.description = viewModel.description
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.onSave = onSave
        _viewModel = StateObject(wrappedValue: ViewModel(location: location))
    }
}

#Preview {
    EditView(location: .expample){ _ in}
}
