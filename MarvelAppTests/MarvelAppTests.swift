//
//  MarvelAppTests.swift
//  MarvelAppTests
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import XCTest
@testable import MarvelApp

final class MarvelAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHeroModel() throws {
        let json = """
        {
          "id": 1009144,
          "name": "A.I.M.",
          "description": "AIM is a terrorist organization bent on destroying the world.",
          "thumbnail": {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec",
            "extension": "jpg"
          },
          "series": {
            "available": 36,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009144/series",
            "items": [
              {
                "resourceURI": "http://gateway.marvel.com/v1/public/series/13082",
                "name": "Ant-Man & the Wasp (2010 - 2011)"
              }
            ]
          },
            "comics": {
                "available": 53,
                "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009144/comics",
                "items": [
                    {
                        "resourceURI": "http://gateway.marvel.com/v1/public/comics/36763",
                        "name": "Ant-Man & the Wasp (2010) #3"
                    }
                ]
            }
        }
        """.data(using: .utf8)!
        
        let jsonDecoder = JSONDecoder()
        
        let hero = try jsonDecoder.decode(Hero.self, from: json)
        
        XCTAssertEqual(hero.id, 1009144)
        XCTAssertEqual(hero.name, "A.I.M.")
        XCTAssertEqual(hero.description, "AIM is a terrorist organization bent on destroying the world.")
        XCTAssertEqual(hero.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec")
        XCTAssertEqual(hero.series.collectionURI, "http://gateway.marvel.com/v1/public/characters/1009144/series")
        XCTAssertEqual(hero.series.items.first?.resourceURI, "http://gateway.marvel.com/v1/public/series/13082")
        XCTAssertEqual(hero.comics.items.first?.name, "Ant-Man & the Wasp (2010) #3")
    }
    
    func testSerieModel() throws {
        
        let json = """
            {
                "title": "Avengers (1963 - 1996)",
                "description": "Avengers Assemble! Iron Man, Thor, Captain America and the rest of Earth's Mightiest Heroes unite to stand against the threats none can face alone! See the Avengers go up against Ultron, Kang, the Masters of Evil and more over three decades of epic action!",
                "thumbnail": {
                            "path": "http://i.annihil.us/u/prod/marvel/i/mg/9/10/519baa6d1890a",
                            "extension": "jpg"
                            },
                "creators": {
                            "items": [
                                {
                                "name": "Malibu",
                                "role": "colorist"
                                }
                            ]
                            }
            }
            """.data(using: .utf8)!
        
        
        let jsonDecoder = JSONDecoder()
        
        let serie = try jsonDecoder.decode(SerieModel.self, from: json)
        
        XCTAssertEqual(serie.title, "Avengers (1963 - 1996)")
        XCTAssertEqual(serie.description, "Avengers Assemble! Iron Man, Thor, Captain America and the rest of Earth's Mightiest Heroes unite to stand against the threats none can face alone! See the Avengers go up against Ultron, Kang, the Masters of Evil and more over three decades of epic action!")
        XCTAssertEqual(serie.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/9/10/519baa6d1890a")
        XCTAssertEqual(serie.creators?.items?.first?.name, "Malibu")
        XCTAssertEqual(serie.creators?.items?.first?.role, "colorist")
        
    }

    func testComicModel() throws {
        let json = """
                {
                    "title": "Avengers: The Initiative (2007) #14",
                    "description": "The fates of The Initiative, the United States, and Planet Earth hang in the balance. Plus: Former Avenger, Delroy Garret, assumes the mantle and arsenal of Earth's greatest Skrull-Hunter, The 3-D Man.",
                    "prices": [
                        {
                            "type": "printPrice",
                            "price": 2.99
                        }
                    ],
                    "thumbnail": {
                        "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/60/58dbce634ea70",
                        "extension": "jpg"
                    },
                    "creators": {
                        "items": [
                            {
                                "name": "Tom Brevoort",
                                "role": "editor"
                            }
                        ]
                }
            }
            """.data(using: .utf8)!
        
        let jsonDecoder = JSONDecoder()
        
        let comic = try jsonDecoder.decode(ComicModel.self, from: json)
        
        XCTAssertEqual(comic.title, "Avengers: The Initiative (2007) #14")
        XCTAssertEqual(comic.description, "The fates of The Initiative, the United States, and Planet Earth hang in the balance. Plus: Former Avenger, Delroy Garret, assumes the mantle and arsenal of Earth's greatest Skrull-Hunter, The 3-D Man.")
        XCTAssertEqual(comic.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/60/58dbce634ea70")
        XCTAssertEqual(comic.prices?.first?.type, "printPrice")
        XCTAssertEqual(comic.prices?.first?.price, 2.99)
        XCTAssertEqual(comic.creators?.items?.first?.name, "Tom Brevoort")
        XCTAssertEqual(comic.creators?.items?.first?.role, "editor")
    }
}
