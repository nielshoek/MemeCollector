//
//  FilteredMemes.swift
//  MemeCollector
//
//  Created by Niels Hoek on 03/03/2021.
//

import SwiftUI

struct FilteredMemes: View {
    @EnvironmentObject var myMemesViewModel: MyMemesViewModel
    
    var fetchRequest: FetchRequest<MemeEntity>
    var memes: FetchedResults<MemeEntity> {
        fetchRequest.wrappedValue
    }

    @State private(set) var refreshId: UUID
    
    init(predicate: NSPredicate, sortDescriptors: [NSSortDescriptor], refreshId: UUID) {
        fetchRequest = FetchRequest<MemeEntity>(
            entity: MemeEntity.entity(),
            sortDescriptors: sortDescriptors,
            predicate: predicate
        )
        
        _refreshId = State(wrappedValue: refreshId)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 18) {
                ForEach(memes, id: \.id) { meme in
                    MemeView(meme: meme, myMemesViewModel: myMemesViewModel)
                }.id(refreshId)
            }
        }.animation(.spring(), value: memes)
    }
}
