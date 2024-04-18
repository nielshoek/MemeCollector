//
//  MemeResponse.swift
//  MemeCollector
//
//  Created by Niels Hoek on 25/02/2021.
//

import Foundation

struct MemeResponse: Codable {
    var memes: [Meme]
}

struct Meme: Codable {
    var id = UUID()
    var saved = false
    
    var title: String
    var url: String
    var author: String
    var postLink: String
    var preview: [String]
    
    var imgData: Data?
    
    private enum CodingKeys: String, CodingKey {
        case title, url, preview, author, postLink
    }
}
