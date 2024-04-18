//
//  MemeView.swift
//  MemeCollector
//
//  Created by Niels Hoek on 26/02/2021.
//

import SwiftUI

struct MemeView: View {
    @ObservedObject var meme: MemeEntity
    var myMemesViewModel: MyMemesViewModel
    
    @State private var isSavingImage = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(meme.title) {
                    myMemesViewModel.openInBrowser(meme: meme)
                }
                .foregroundColor(.white)
                .font(.title2)
                Spacer()
            }.padding()
            
            Image(uiImage: UIImage(data: meme.displayImageData ?? meme.imgData) ?? UIImage())
                .resizable()
                .scaledToFit()
            
            HStack {
                Text("Credits: \(meme.author)").font(.system(size: 13))
                Spacer()
                Button(action: {
                    isSavingImage = true
                }) {
                    Image(systemName: "rectangle.stack.badge.plus")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
                }
                .padding(.trailing)
                .alert(isPresented: $isSavingImage) {
                    Alert(
                        title: Text("Are you sure you want to save this image to your camera roll?"),
                        primaryButton: .default(Text("Save")) {
                            myMemesViewModel.saveToCameraRoll(meme: meme)
                        },
                        secondaryButton: .cancel()
                    )
                }
                NavigationLink(destination: EditMemeView(editMemeViewModel: EditMemeViewModel(meme: meme))) {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
                }.padding(.trailing)
                Button(action: {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        myMemesViewModel.delete(memeEntity: meme)
                    }
                }) {
                    Image(systemName: "trash")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
                }
            }.padding()
        }
        .transition(.move(edge: .leading))
        .background(Color.primaryColor)
        .foregroundColor(Color.white)
        .onTapGesture(count: 3) {
            myMemesViewModel.applyImageFilter(meme: meme)
        }
    }
}
