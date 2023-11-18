//
//  Hero.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import Foundation

struct HeroResponse: Codable {
    let data: Results
}

struct Results: Codable {
    let results: [Hero]
}
            
struct Hero: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let comics: Comics
    let series: Series
}

struct Thumbnail: Codable {
    let path: String
    let extensionPath = ".jpg"
    
    enum CodingKeys: String, CodingKey {
        case path
        case extensionPath = "extension"
    }
}

struct Comics: Codable {
    var available: Int
    var collectionURI: String
    var items: [Comic]
}

struct Comic: Codable, Hashable {
    let resourceURI: String
    let name: String
}

struct Serie: Codable, Hashable {
    let resourceURI: String
    let name: String
}

struct Series: Codable {
    let available: Int
    let collectionURI: String
    let items: [Serie]
}
