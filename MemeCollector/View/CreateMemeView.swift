//
//  CreateMemeView.swift
//  MemeCollector
//
//  Created by Niels Hoek on 01/03/2021.
//

import SwiftUI

struct CreateMemeView: View {
    @Environment(\.showingSheet) var showingSheet
    @ObservedObject var createMemeViewModel: CreateMemeViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                TextField("Title", text: $createMemeViewModel.title)
                    .padding(8)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.separator)))
                    .padding()
                Image(uiImage: createMemeViewModel.uiImage)
                    .resizable()
                    .scaledToFit()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Select category").font(.headline)
                        Picker(createMemeViewModel.selectedCategoryString,
                               selection: $createMemeViewModel.selectedCategory) {
                            ForEach(MemeEntity.categories, id: \.self) {
                                Text($0).tag($0)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    Spacer()
                }
                .padding()
                .background(Color.secondaryColor)
                HStack {
                    Text(createMemeViewModel.errorMessage).foregroundColor(.red)
                    Spacer()
                    Button(action: {
                        let success = createMemeViewModel.save()
                        if success {
                            showingSheet?.wrappedValue = false
                        }
                    }) {
                        HStack {
                            Text("Save").font(.headline)
                            Image(systemName: "checkmark")
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(5)
                }.padding()
                
                Spacer()
            }
        }.navigationBarTitleDisplayMode(.inline)
    }
    
}

struct CreateMemeView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMemeView(createMemeViewModel: CreateMemeViewModel(uiImage: UIImage()))
    }
}
