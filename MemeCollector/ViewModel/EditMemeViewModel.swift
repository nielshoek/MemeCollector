//
//  EditMemeViewModel.swift
//  MemeCollector
//
//  Created by Niels Hoek on 27/02/2021.
//

import Foundation

class EditMemeViewModel: ObservableObject {
    
    var meme: MemeEntity
    @Published var editTitle = ""
    var category: String {
        get {
            categoryString
        }
        set {
            categoryString = newValue
        }
    }
    @Published var categoryString = "No category"
    
    var categories: [String] {
        MemeEntity.categories
    }
    
    private var context = PersistenceController.context
    
    init(meme: MemeEntity) {
        self.meme = meme
        editTitle = meme.title
        if let memeCategory = meme.category {
            category = memeCategory
        }
    }
    
    func update() {
        context.performAndWait {
            meme.title = editTitle
            meme.category = category
            try? context.save()
        }
    }
    
}
