//
//  MyMemesViewModel.swift
//  MemeCollector
//
//  Created by Niels Hoek on 26/02/2021.
//

import Foundation
import CoreData
import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

class MyMemesViewModel: ObservableObject {
    @Published 
    var filterPredicate: NSPredicate = NSPredicate.all
    
    @Published
    var sortDescriptors: [NSSortDescriptor] = []
    
    private var context = PersistenceController.context
    var coreImageContext = CIContext()
    
    var categories: [String] {
        MemeEntity.categories + ["All"]
    }
    
    var sortTypes = SortType.allCases.map { $0.rawValue }
    
    @Published var categoryPickerString = "Filter category"
    var selectedCategory: String {
        get {
            categoryPickerString
        }
        set {
            categoryPickerString = newValue
        }
    }
    
    @Published var sortPickerString = "Sort"
    var selectedSort: String {
        get {
            sortPickerString
        }
        set {
            print(newValue)
            sortPickerString = newValue
        }
    }
    
    init() {
        self.objectWillChange.send()
    }
    
    func filter(category: String) {
        if MemeEntity.categories.contains(category) {
            filterPredicate = NSPredicate(format: "category = %@", category)
        } else {
            filterPredicate = NSPredicate.all
        }
    }
    
    func sort(sortType: SortType) {
        sortDescriptors = { switch sortType {
        case .dateAsc:
            return [NSSortDescriptor(keyPath: \MemeEntity.date, ascending: true)]
        case .dateDesc:
            return [NSSortDescriptor(keyPath: \MemeEntity.date, ascending: false)]
        case .titleAsc:
            return [NSSortDescriptor(keyPath: \MemeEntity.title, ascending: true)]
        case .titleDesc:
            return [NSSortDescriptor(keyPath: \MemeEntity.title, ascending: false)]
        }}()
    }
    
    func delete(memeEntity: MemeEntity) {
        guard let objectData = memeEntity as NSManagedObject? else { return }
        
        context.delete(objectData)
        try? context.save()
        self.objectWillChange.send()
    }
    
    func openInBrowser(meme: MemeEntity) {
        if let url = URL(string: meme.redditUrl), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func saveToCameraRoll(meme: MemeEntity) {
        if let image = UIImage(data: meme.imgData) {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
    
    func applyImageFilter(meme: MemeEntity) {
        let filter = CIFilter.sepiaTone()
        filter.inputImage = CIImage(image: UIImage(data: meme.imgData) ?? UIImage())
        filter.intensity = 30
        
        guard let outputImage = filter.outputImage else { return }
        
        if let cgimg = coreImageContext.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            if let imageData = uiImage.pngData() {
                meme.displayImageData = imageData
                meme.objectWillChange.send()
            }
        }
    }
    
}

enum SortType: String, CaseIterable {
    case dateAsc = "Date ascending"
    case dateDesc = "Date descending"
    case titleAsc = "Title ascending"
    case titleDesc = "Title descending"
}
