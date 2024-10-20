//
//  ContentView.swift
//  PhotoPicker77
//
//  Created by 최정안 on 10/11/24.
//

import PhotosUI
import SwiftUI

struct NamedImage: Identifiable, Comparable, Codable {
    let id = UUID()
    let name: String
    let imageData: Data
    
    var image: Image {
        Image(uiImage: UIImage(data: imageData)!)
    }
    
    static func < (lhs: NamedImage, rhs: NamedImage) -> Bool
    {
        lhs.name < rhs.name
    }
}

struct ContentView: View {
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [NamedImage]()
    
    @State private var showingNamePrompt = false
    @State private var newName = ""
    
    @State private var temporaryImageData: Data?
    
    var body: some View {
        NavigationStack{
            VStack{
                PhotosPicker(selection: $pickerItems){
                    Label("Select a picture", systemImage: "photo")
                }
                
                List(selectedImages.sorted()){
                    namedImage in
                    NavigationLink {
                        DetailView(namedImage: namedImage)
                    } label: {
                        Text(namedImage.name)
                    }
                    VStack{
                        namedImage.image
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
        .navigationTitle("Photos")
        .onChange(of: pickerItems) {
            Task{
                for item in pickerItems {
                    if let imageData = try await item.loadTransferable(type: Data.self){
                        temporaryImageData = imageData
                        newName = ""
                        showingNamePrompt = true
                        
                    }
                }
            }
        }
        .alert("Enter a name", isPresented: $showingNamePrompt) {
            TextField("photo name", text: $newName)
            Button("Save", role: .cancel){
                if let imageData = temporaryImageData, !newName.isEmpty {
                    let namedImage = NamedImage(name: newName, imageData: imageData)
                    selectedImages.append(namedImage)
                }
                newName = ""
            }
        }
    }
    
    func saveImages() {
        do{
            let encoded = try JSONEncoder().encode(selectedImages)
            UserDefaults.standard.set(encoded, forKey: "SavedImages")
        } catch {print("Saving Error")}
    }
    func loadImages() {
        if let data = UserDefaults.standard.data(forKey: "SavedImages"){
            do {
                let decoded = try JSONDecoder().decode([NamedImage].self, from: data)
                selectedImages = decoded
            } catch {print("Decoding Error")}
        } else {
            print("No image")
        }
    }
}

#Preview {
    ContentView()
}
