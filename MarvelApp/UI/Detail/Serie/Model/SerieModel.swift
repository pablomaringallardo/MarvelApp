//
//  SerieModel.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import Foundation

struct ResponseSerie: Codable {
    let data: SerieResults
}

struct SerieResults: Codable {
    let results: [SerieModel]
}

struct SerieModel: Codable {
    let title: String
    let description: String?
    let thumbnail: Thumbnail
    let creators: Creators?
}

struct Creators: Codable {
    let items: [Creator]?
}

struct Creator: Codable, Hashable {
    let name: String?
    let role: String?
}
