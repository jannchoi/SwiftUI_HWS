//
//  ContentView.swift
//  Instafilter
//
//  Created by 최정안 on 10/5/24.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 0.5
    @State private var selectedItem: PhotosPickerItem?
    @State private var showingFilter = false
    
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview

    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                
                PhotosPicker(selection: $selectedItem) {
                    
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
                
                Spacer()
                
                HStack{
                    
                    if let processedImage {
                        Text("Intensity")
                        Slider(value: $filterIntensity)
                            .disabled(!currentFilter.inputKeys.contains(kCIInputIntensityKey))
                            .onChange(of: filterIntensity, applyProcessing)
                        
                        Spacer()
                        Text("Radius")
                        Slider(value: $filterRadius)
                            .disabled(!currentFilter.inputKeys.contains(kCIInputRadiusKey))
                            .onChange(of: filterRadius, applyProcessing)
                    }
                    
                }
                
                HStack{
                    if let processedImage {
                        Button("Change Filter", action: changeFilter)
                    }
                    
                    Spacer()
                    
                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .confirmationDialog("Select a filter", isPresented: $showingFilter) {
                Button("Crystallize"){ setFilter(CIFilter.crystallize())}
                Button("Edges"){setFilter(CIFilter.edges())}
                Button("Gaussian Blur") {setFilter(CIFilter.gaussianBlur())}
                Button("Pixellate") {setFilter(CIFilter.pixellate())}
                Button("Sepia Tone") {setFilter(CIFilter.sepiaTone())}
                Button("UnSharp Mask") {setFilter(CIFilter.unsharpMask())}
                Button("Vignette") {setFilter(CIFilter.vignette())}
                Button("Area Average") {setFilter(CIFilter.areaAverage())}
                Button("Bloom") {setFilter(CIFilter.bloom())}
                Button("Circular Screen") {setFilter(CIFilter.circularScreen())}
                Button("Cancel", role: .cancel) {}
            }
        }
    }
    
    func changeFilter() {
        showingFilter = true
    }
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }

            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey){
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey){
            currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey){
            currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }
        
        guard let outputImage = currentFilter.outputImage else {return}
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {return}
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
    
    @MainActor func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
        
        filterCount += 1
        
        if filterCount >= 20{
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
