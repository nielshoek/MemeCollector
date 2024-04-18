//
//  MemeFeedViewModel.swift
//  MemeCollector
//
//  Created by Niels Hoek on 25/02/2021.
//

import Foundation
import CoreData

class MemeFeedViewModel: ObservableObject {
    @Published var memes = [Meme]()
    @Published var isLoadingPage = false
    private var canLoadMorePages = true
    
    
    @Published var sourcePickerString = "Pick a meme source"
    private var _selectedSource = ""
    var selectedSource: String {
        get {
            _selectedSource
        }
        set {
            _selectedSource = newValue == "Random" ? "" : newValue
            sourcePickerString = newValue
            refresh()
        }
    }
    
    var sources: [String]
    
    private var context = PersistenceController.context

    init() {
        sources = [String](Subreddits.allCases.map { $0.rawValue })
        
        loadMoreContent()
    }
    
    func save(meme: Meme) {
        guard meme.imgData != nil else { return }

        let memeEntity = MemeEntity(context: context)
        memeEntity.id = meme.id
        memeEntity.title = meme.title
        memeEntity.imgData = meme.imgData!
        memeEntity.author = meme.author
        memeEntity.redditUrl = meme.postLink
        memeEntity.date = Date()
        
        try? context.save()
        
        if let index = self.memes.firstIndex(where: { meme.id == $0.id }) {
            memes[index].saved = true
        }
    }
    
    func delete(meme: Meme) {
        let id = meme.id
        let result = try? context.fetch(MemeEntity.fetchRequest(predicate: NSPredicate(format: "id = %@", id.uuidString))).first
        
        guard let objectData = result as NSManagedObject? else {return}
        context.delete(objectData)
        
        try? context.save()
        
        if let index = self.memes.firstIndex(where: { meme.id == $0.id }) {
            memes[index].saved = false
        }
    }
    
    func loadMoreContentIfNeeded(currentItem item: Meme?) {
        guard let item = item else {
            loadMoreContent()
            return
        }
        
        let thresholdIndex = memes.index(memes.endIndex, offsetBy: -1)
        if memes.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
            loadMoreContent()
        }
    }
    
    func refresh() {
        memes = [Meme]()
        loadMoreContent()
    }
    
    private func loadMoreContent() {
        guard !isLoadingPage && canLoadMorePages else { return }
        
        isLoadingPage = true
        
        if let url = createUrl(subreddit: selectedSource) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                let decoder = JSONDecoder()
				if let data = MemesJSON.string.data(using: .utf8) {
                    do {
                        let memeResponse = try decoder.decode(MemeResponse.self, from: data)
                        
                        DispatchQueue.main.async {
                            self.isLoadingPage = false
                            self.memes += memeResponse.memes
                            // Fetch image data for all memes without image data
                            let memesWithoutImage = self.memes.filter { $0.imgData == nil }
                            for meme in memesWithoutImage {
                                let index = self.memes.firstIndex { meme.id == $0.id } ?? -1
                                let url = URL(string: meme.preview.last ?? "")!
                                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                                    if let data = data {
                                        DispatchQueue.main.async {
                                            self.memes[index].imgData = data
                                        }
                                    }
                                }
                                task.resume()
                            }

                        }
                    } catch let jsonError {
                        print("JSON decode failed: \(jsonError.localizedDescription)")
                    }
                }
            }

            task.resume()
        }
    }
    
    private func createUrl(subreddit: String = "") -> URL? {
        var urlQuery = subreddit
        if urlQuery.count > 0 {
            urlQuery += "/"
        }
        
        let urlString = "https://meme-api.herokuapp.com/gimme/\(urlQuery)2"
        let url = URL(string: urlString)
        
        return url
    }
    
    // Remove all saved memes. For testing/demo
    static func deleteEverything(context: NSManagedObjectContext) {
        let fetchRequest = NSFetchRequest<MemeEntity>(entityName: "MemeEntity")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as NSManagedObject? else {continue}
                context.delete(objectData)
            }
            try? context.save()
        } catch {}
    }
}

enum Subreddits: String, CaseIterable {
    case Random,
         ik_ihe,
         dankmemes,
         memes,
         okemakkermaloot,
         NederlandseMemes
}
