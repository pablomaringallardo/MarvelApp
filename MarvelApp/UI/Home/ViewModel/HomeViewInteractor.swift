//
//  HomeViewInteractor.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import Foundation
import Combine

protocol HomeViewInteractorProtocol: AnyObject {
    func getHeros(filterName: String) -> AnyPublisher<HeroResponse, Error>
}

final class HomeViewInteractor: HomeViewInteractorProtocol {
    
    let networker: NetworkerProtocol
    let networkManager: NetworkManager
    
    init(networker: NetworkerProtocol = Networker(), networkManager: NetworkManager = NetworkManager()) {
        self.networker = networker
        self.networkManager = networkManager
    }
    
    func getHeros(filterName: String) -> AnyPublisher<HeroResponse, Error> {
        return networker.callServer(type: HeroResponse.self, request: networkManager.getHeros(filterName: filterName))
    }
    
}
