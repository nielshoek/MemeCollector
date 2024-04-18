//
//  CreateMemeView.swift
//  MemeCollector
//
//  Created by Niels Hoek on 28/02/2021.
//

import SwiftUI

struct ImportMemeView: View {
    @State private var inputImage: UIImage?
    @State private var imageIsImported = false
    
    var body: some View {
        NavigationView {
            VStack {
                ImagePicker(image: $inputImage, callback: loadImage)
                NavigationLink(
                    destination: CreateMemeView(createMemeViewModel: CreateMemeViewModel(uiImage: inputImage ?? UIImage())),
                    isActive: $imageIsImported) {
                    EmptyView()
                }
            }.navigationBarHidden(true)
        }
    }
    
    func loadImage() {
        guard inputImage != nil else { return }
        imageIsImported = true
    }
}
