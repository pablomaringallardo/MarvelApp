//
//  ComicModel.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import Foundation

struct ResponseComic: Codable {
    let data: ComicResults
}

struct ComicResults: Codable {
    let results: [ComicModel]
}

struct ComicModel: Codable {
    let title: String
    let description: String?
    let thumbnail: Thumbnail
    let prices: [Price]?
    let creators: Creators?
}

struct Price: Codable, Hashable {
    let type: String?
    let price: Float32?
}
