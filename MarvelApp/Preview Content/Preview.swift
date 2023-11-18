//
//  Preview.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import Foundation

extension Hero {
    static let heroPreview = Hero(id: 1, name: "Spiderman", description: "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/1/70/4c003adccbe4f"), comics: Comics(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics", items: [Comic(resourceURI: "http://gateway.marvel.com/v1/public/comics/21366", name: "Avengers: The Initiative (2007) #14")]), series: Series(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/series", items: [Serie(resourceURI: "http://gateway.marvel.com/v1/public/comics/21366", name: "Avengers: The Initiative (2007) #14")]))
}

extension SerieModel {
    static let seriePreview = SerieModel(
        title: "Avengers (1963 - 1996)",
        description: "Avengers Assemble! Iron Man, Thor, Captain America and the rest of Earth's Mightiest Heroes unite to stand against the threats none can face alone! See the Avengers go up against Ultron, Kang, the Masters of Evil and more over three decades of epic action!",
        thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/10/519baa6d1890a"),
        creators: Creators(items: [
        Creator(name: "Malibu", role: "colorist"),
        Creator(name: "Paul Becton", role: "colorist"),
        Creator(name: "Karl Bollers", role: "colorist"),
        Creator(name: "Eliot R. Brown", role: "colorist")
        ])
    )
}

extension ComicModel {
    static let comicPreview = ComicModel(
        title: "Avengers: The Initiative (2007) #14",
        description: "The fates of The Initiative, the United States, and Planet Earth hang in the balance. Plus: Former Avenger, Delroy Garret, assumes the mantle and arsenal of Earth's greatest Skrull-Hunter, The 3-D Man.",
        thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/58dbce634ea70"),
        prices: [
            Price(
                type: "printPrice",
                price: 2.99
            ),
            Price(
                type: "digitalPurchasePrice",
                price: 1.99
            )
        ],
        creators: Creators(items: [
            Creator(
                name: "Tom Brevoort",
                role: "editor"
            )
        ])
    )
}
