//
//  HomeViewModel.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var status = Status.loading
    @Published var heros: [Hero]?
    var suscriptors = Set<AnyCancellable>()
    var interactor: HomeViewInteractorProtocol
    
    init(interactor: HomeViewInteractorProtocol = HomeViewInteractor()) {
        self.interactor = interactor
        self.getHeros(filterName: "")
    }
    
    func getHeros(filterName: String) {
        
        interactor.getHeros(filterName: filterName)
            .sink { completion in
                switch completion {
                case .failure:
                    self.status = .error(error: "Error al buscar los héroes")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { response in
                self.heros = response.data.results
            }
            .store(in: &suscriptors)
    }
}
