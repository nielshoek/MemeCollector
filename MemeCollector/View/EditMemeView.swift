//
//  EditMemeView.swift
//  MemeCollector
//
//  Created by Niels Hoek on 26/02/2021.
//

import SwiftUI

struct EditMemeView: View {
    @ObservedObject var editMemeViewModel: EditMemeViewModel
    @State private var isEditingTitle = false
    
    var meme: MemeEntity {
        editMemeViewModel.meme
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(spacing: 0) {
                    HStack {
                        if isEditingTitle {
                            TextField("Title", text: $editMemeViewModel.editTitle, onCommit: {
                                editMemeViewModel.update()
                                isEditingTitle = false
                            })
                            .padding(8)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.separator)))
                        } else {
                            Button(meme.title) {
                                isEditingTitle = true
                            }
                            .font(.title2)
                            .foregroundColor(.white)
                            Spacer()
                        }
                    }.padding()
                    Image(uiImage: UIImage(data: meme.imgData) ?? UIImage())
                        .resizable()
                        .scaledToFit()
                    HStack {
                        Text("Credits: \(meme.author)").font(.system(size: 13))
                        Spacer()
                    }.padding()
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Select category").font(.headline)
                            Picker(editMemeViewModel.categoryString,
                                   selection: $editMemeViewModel.category) {
                                ForEach(editMemeViewModel.categories, id: \.self) {
                                    Text($0).tag($0)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .onChange(of: editMemeViewModel.category) { value in
                                editMemeViewModel.update()
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.secondaryColor)
                }.background(Color.primaryColor)
                Spacer()
            }
        }
        .navigationTitle("Edit meme")
    }
}
