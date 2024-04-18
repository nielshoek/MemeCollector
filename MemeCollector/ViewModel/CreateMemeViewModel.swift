//
//  CreateMemeViewModel.swift
//  MemeCollector
//
//  Created by Niels Hoek on 28/02/2021.
//

import SwiftUI

class CreateMemeViewModel: ObservableObject {
    var title = ""
    private var _selectedCategory = ""
    var selectedCategory: String {
        get {
            _selectedCategory
        }
        set {
            selectedCategoryString = newValue
            _selectedCategory = newValue
        }
    }
    var uiImage: UIImage
    
    @Published var selectedCategoryString = "No category selected"
    @Published var errorMessage = ""
    
    var context = PersistenceController.context
    
    init(uiImage: UIImage) {
        self.uiImage = uiImage
    }
    
    func save() -> Bool {
        guard title.count > 0 else {
            errorMessage = "Insert a title"
            return false
        }
        
        if let imgData = uiImage.pngData() {
            let memeEntity = MemeEntity(context: context)
            memeEntity.id = UUID()
            memeEntity.title = title
            memeEntity.imgData = imgData
            memeEntity.author = "You"
            memeEntity.category = selectedCategory
            memeEntity.date = Date()
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }

            return true
        }
        return false
    }
}
