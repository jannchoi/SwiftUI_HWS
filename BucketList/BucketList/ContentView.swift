//
//  ContentView.swift
//  BucketList
//
//  Created by 최정안 on 10/7/24.
//

import MapKit
import SwiftUI

struct ContentView: View {
    let startPosition = MapCameraPosition.region(MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 56, longitude: -3), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)))
    
    @State private var showingHybrid = false

    @State private var viewModel = ViewModel()
    
    var body: some View {
        if viewModel.isUnlocked {
            MapReader{ proxy in
                VStack{
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) {
                            location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onLongPressGesture() {
                                        viewModel.selectedPlace = location
                                    }
                            }
                        }
                    }
                    Toggle("Hybrid", isOn: $showingHybrid)
                }
                .mapStyle(showingHybrid ? .hybrid : .standard)
                .onTapGesture {
                    position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        viewModel.addLocation(at: coordinate)
                    }
                }
                .sheet(item: $viewModel.selectedPlace) {
                    place in
                    EditView(location: place) {
                        viewModel.update(location: $0)
                    }
                }
                .alert("error", isPresented: $viewModel.showingAlert) {
                    Button("OK") {}
                } message: {
                    Text("Something wrong with unlocking")
                }
            }
        } else {
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
        }
    }
}

#Preview {
    ContentView()
}
