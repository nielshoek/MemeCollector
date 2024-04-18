//
//  MyMemesView.swift
//  MemeCollector
//
//  Created by Niels Hoek on 26/02/2021.
//

import SwiftUI

struct MyMemesView: View {
    @StateObject var myMemesViewModel: MyMemesViewModel = MyMemesViewModel()
    
    @FetchRequest(
        fetchRequest: MemeEntity.fetchRequest()
    ) private var memes: FetchedResults<MemeEntity>
    
    var filterPredicate: NSPredicate {
        myMemesViewModel.filterPredicate
    }
    
    var sortDescriptors: [NSSortDescriptor] {
        myMemesViewModel.sortDescriptors
    }
    
    @State private var showingImagePicker = false
    @State private var refreshId = UUID()
    
    var body: some View {
        ScrollView {
            VStack {
                Divider()
                if memes.count < 1 {
                    Text("You haven't saved any memes yet!").font(.headline).padding()
                    Spacer()
                } else {
                    HStack {
                        Picker(myMemesViewModel.categoryPickerString,
                               selection: $myMemesViewModel.selectedCategory) {
                            ForEach(myMemesViewModel.categories, id: \.self) {
                                Text($0)
                            }
                        }
                        .onChange(of: myMemesViewModel.selectedCategory) { value in
                            myMemesViewModel.filter(category: value)
                        }
                        Spacer()
                        Picker(myMemesViewModel.sortPickerString,
                               selection: $myMemesViewModel.selectedSort) {
                            ForEach(myMemesViewModel.sortTypes, id: \.self) {
                                Text($0)
                            }
                        }
                        .onChange(of: myMemesViewModel.selectedSort) { value in
                            myMemesViewModel.sort(sortType: SortType(rawValue: value) ?? SortType.dateAsc)
                        }
                    }
                    .animation(nil)
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                    FilteredMemes(predicate: filterPredicate,
                                  sortDescriptors: sortDescriptors,
                                  refreshId: refreshId
                    )
                    .environmentObject(myMemesViewModel)
                }
            }
        }
        .navigationTitle("My Memes")
        .navigationBarItems(trailing: addMeme)
        .sheet(isPresented: $showingImagePicker) {
            ImportMemeView()
                .environment(\.showingSheet, self.$showingImagePicker)
                .onDisappear { self.refreshId = UUID() }
        }
    }
    
    var addMeme: some View {
        Button("Add from library") {
            self.showingImagePicker = true
        }
    }
}

struct ShowingSheetKey: EnvironmentKey {
    static let defaultValue: Binding<Bool>? = nil
}

extension EnvironmentValues {
    var showingSheet: Binding<Bool>? {
        get { self[ShowingSheetKey.self] }
        set { self[ShowingSheetKey.self] = newValue }
    }
}

struct MyMemesView_Previews: PreviewProvider {
    static var previews: some View {
        MyMemesView()
    }
}
