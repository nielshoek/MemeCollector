//
//  MemeCollectorApp.swift
//  MemeCollector
//
//  Created by Niels Hoek on 25/02/2021.
//

import SwiftUI

@main
struct MemeCollectorApp: App {
    private let memeFeedViewModel = MemeFeedViewModel()

    var body: some Scene {
        WindowGroup {
            MemeFeedView(memeFeedViewModel: memeFeedViewModel)
                .environment(\.managedObjectContext, PersistenceController.context)
        }
    }
}
