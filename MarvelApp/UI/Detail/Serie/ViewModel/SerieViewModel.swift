//
//  SerieViewModel.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import Foundation
import Combine

final class SerieViewModel: ObservableObject {
    @Published var status = Status.loading
    @Published var serie: SerieModel?
    var suscriptors = Set<AnyCancellable>()
    var interactor: SerieViewInteractorProtocol
    
    init(
        interactor: SerieViewInteractorProtocol = SerieViewInteractor(),
        testing: Bool = false
    ) {
        self.interactor = interactor
        if testing {
            getSerieTesting()
        }
    }
    
    func getSerie(url: String) {
        interactor.getSeries(url: url)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.status = .error(error: "Error al buscar la serie. \(error.localizedDescription)")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { response in
                self.serie = response.data.results[0]
            }
            .store(in: &suscriptors)
    }
    
    func getSerieTesting() {
        self.serie = .seriePreview
    }
}
