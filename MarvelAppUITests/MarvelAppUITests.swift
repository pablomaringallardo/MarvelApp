//
//  MarvelAppUITests.swift
//  MarvelAppUITests
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import XCTest
import SwiftUI
import ViewInspector
import CachedAsyncImage

@testable import MarvelApp

final class MarvelAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDetailHero() throws {
        
        let detailView = DetailView(hero: Hero(id: 1, name: "Spiderman", description: "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/1/70/4c003adccbe4f"), comics: Comics(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics", items: [Comic(resourceURI: "http://gateway.marvel.com/v1/public/comics/21366", name: "Avengers: The Initiative (2007) #14")]), series: Series(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/series", items: [Serie(resourceURI: "http://gateway.marvel.com/v1/public/comics/21366", name: "Avengers: The Initiative (2007) #14")])))
        XCTAssertNotNil(detailView)
        
        let name = try detailView.inspect().find(viewWithId: 0)
        XCTAssertNotNil(name)
        
        let description = try detailView.inspect().find(viewWithId: 1)
        XCTAssertNotNil(description)
    }
    
    func testHorizontalScrollSerie() throws {
        
         let horizontalScroll = HorizontalScrollSeriesView(hero: Hero(id: 1, name: "Spiderman", description: "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/1/70/4c003adccbe4f"), comics: Comics(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics", items: [Comic(resourceURI: "http://gateway.marvel.com/v1/public/comics/21366", name: "Avengers: The Initiative (2007) #14")]), series: Series(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/series", items: [Serie(resourceURI: "http://gateway.marvel.com/v1/public/comics/21366", name: "Avengers: The Initiative (2007) #14")])))
        XCTAssertNotNil(horizontalScroll)
        
        let image = try horizontalScroll.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        let rectangle = try horizontalScroll.inspect().find(viewWithId: 1)
        XCTAssertNotNil(rectangle)
        
        let serieName = try horizontalScroll.inspect().find(viewWithId: 2)
        XCTAssertNotNil(serieName)
    }
    
    func testHorizontalScrollComic() throws {
        
         let horizontalScroll = HorizontalScrollComicView(hero: Hero(id: 1, name: "Spiderman", description: "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/1/70/4c003adccbe4f"), comics: Comics(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics", items: [Comic(resourceURI: "http://gateway.marvel.com/v1/public/comics/21366", name: "Avengers: The Initiative (2007) #14")]), series: Series(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/series", items: [Serie(resourceURI: "http://gateway.marvel.com/v1/public/comics/21366", name: "Avengers: The Initiative (2007) #14")])))
        XCTAssertNotNil(horizontalScroll)
        
        let image = try horizontalScroll.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        let rectangle = try horizontalScroll.inspect().find(viewWithId: 1)
        XCTAssertNotNil(rectangle)
        
        let serieName = try horizontalScroll.inspect().find(viewWithId: 2)
        XCTAssertNotNil(serieName)
    }
    
}
