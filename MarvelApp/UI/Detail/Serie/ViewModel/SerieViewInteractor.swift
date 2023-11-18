//
//  SerieViewInteractor.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import Foundation
import Combine

protocol SerieViewInteractorProtocol: AnyObject {
    func getSeries(url: String) -> AnyPublisher<ResponseSerie, Error>
}

final class SerieViewInteractor: SerieViewInteractorProtocol {
    
    let networker: NetworkerProtocol
    let networkManager: NetworkManager
    
    init(networker: NetworkerProtocol = Networker(), networkManager: NetworkManager = NetworkManager()) {
        self.networker = networker
        self.networkManager = networkManager
    }
    
    func getSeries(url: String) -> AnyPublisher<ResponseSerie, Error> {
        return networker.callServer(type: ResponseSerie.self, request: networkManager.getSeriesComicsRequest(url: url))
    }
}
