//
//  ContentView.swift
//  MemeCollector
//
//  Created by Niels Hoek on 25/02/2021.
//

import SwiftUI
import CoreData

struct MemeFeedView: View {
    @ObservedObject private(set) var memeFeedViewModel: MemeFeedViewModel
    @State private var scrolledDown = false
    @State private var scrollUpButtonOffset: CGFloat = 100.0
    @State var scrollProxy: ScrollViewProxy?
    @State private var topId = UUID()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollViewReader { scrollProxy in
                    ZStack {
                        ScrollView {
                            VStack(alignment: .leading) {
                                Divider().id(topId)
                                HStack {
                                    Picker(memeFeedViewModel.sourcePickerString,
                                           selection: $memeFeedViewModel.selectedSource) {
                                        ForEach(memeFeedViewModel.sources, id: \.self) {
                                            Text($0)
                                        }
                                    }.pickerStyle(MenuPickerStyle())
                                    Spacer()
                                    Button("Refresh", action: memeFeedViewModel.refresh)
                                }
                                .padding()
                                
                                memeFeed
                                    .navigationTitle("MemeCollector")
                                    .navigationBarItems(leading: myMemes)
                            }
                        }.onAppear {
                            self.scrollProxy = scrollProxy
                        }
                        
                        if scrolledDown {
                            GeometryReader { metrics in
                                Button(action: {
                                    withAnimation {
                                        scrollProxy.scrollTo(topId)
                                    }
                                }) {
                                    Image(systemName: "arrow.up")
                                }
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(1000)
                                .foregroundColor(.white)
                                .position(x: metrics.size.width * 0.9, y: metrics.size.height * 0.05)
                                .offset(x: scrollUpButtonOffset)
                            }
                        }
                        
                    }
                    
                }
            }
            
        }.preferredColorScheme(.dark)
    }

    
    var memeFeed: some View {
        LazyVStack(spacing: 18) {
            ForEach(memeFeedViewModel.memes, id: \.id) { meme in
                VStack(spacing: 0) {
                    HStack {
                        Text(meme.title).font(.title2)
                        Spacer()
                        Button(action: meme.saved ? { memeFeedViewModel.delete(meme: meme) } : { memeFeedViewModel.save(meme: meme) }) {
                            Image(systemName: meme.saved ? "star.fill" : "star").resizable().scaledToFit().frame(width: 30)
                        }
                    }.padding()
                    Group {
                        if let imgData = meme.imgData {
                            Image(uiImage: UIImage(data: imgData) ?? UIImage()).resizable().scaledToFit()
                        } else {
                            ProgressView()
                        }
                    }
                    HStack {
                        Text("Credits: \(meme.author)").font(.system(size: 13))
                        Spacer()
                    }.padding()
                }
                .background(Color.primaryColor)
                .foregroundColor(Color.white)
                .onAppear {
                    memeFeedViewModel.loadMoreContentIfNeeded(currentItem: meme)
                    if let index = memeFeedViewModel.memes.firstIndex(where: { $0.id == meme.id }) {
                        if index > 3 {
                            scrolledDown = true
                            withAnimation(.easeInOut) {
                                self.scrollUpButtonOffset = 0.0
                            }
                        } else {
                            withAnimation(.easeInOut) {
                                self.scrollUpButtonOffset = 100.0
                            }
                        }
                    }
                }
            }
            
            if memeFeedViewModel.isLoadingPage {
                ProgressView()
            }
        }
    }
    
    var myMemes: some View {
        NavigationLink(destination: MyMemesView()) {
            HStack {
                Image(systemName: "folder")
                Text("My Memes")
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemeFeedView(memeFeedViewModel: MemeFeedViewModel())
    }
}
