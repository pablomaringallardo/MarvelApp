//
//  ComicViewInteractor.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import Foundation
import Combine
protocol ComicViewInteractorProtocol: AnyObject {
    func getComics(url: String) -> AnyPublisher<ResponseComic, Error>
}

final class ComicViewInteractor: ComicViewInteractorProtocol {
    let networker: NetworkerProtocol
    let networkManager: NetworkManager
    
    init(networker: NetworkerProtocol = Networker(), networkManager: NetworkManager = NetworkManager()) {
        self.networker = networker
        self.networkManager = networkManager
    }
    
    func getComics(url: String) -> AnyPublisher<ResponseComic, Error> {
        return networker.callServer(type: ResponseComic.self, request: networkManager.getSeriesComicsRequest(url: url))
    }
    
}
