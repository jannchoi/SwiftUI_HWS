//
//  DetailView.swift
//  PhotoPicker77
//
//  Created by 최정안 on 10/11/24.
//

import SwiftUI

struct DetailView: View {
    let namedImage: NamedImage
    var body: some View {
        VStack{
            Text(namedImage.name)
                .font(.headline)
            
            namedImage.image
                .resizable()
                .scaledToFit()
                .navigationTitle(namedImage.name)
                .padding()
        }

    }
}

#Preview {
    DetailView(namedImage: NamedImage(name: "Sample Image", imageData: Data()))
}
