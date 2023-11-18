//
//  ComicViewModel.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import Foundation
import Combine

final class ComicViewModel: ObservableObject {
    @Published var status = Status.loading
    @Published var comic: ComicModel?
    var suscriptors = Set<AnyCancellable>()
    var interactor: ComicViewInteractorProtocol
    
    init(interactor: ComicViewInteractorProtocol = ComicViewInteractor(), testing: Bool = false) {
        self.interactor = interactor
        if testing {
            getComicTesting()
        }
    }
    
    func getComic(url: String) {
        interactor.getComics(url: url)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.status = .error(error: "Error al buscar la serie. \(error.localizedDescription)")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { response in
                self.comic = response.data.results[0]
                print(response.data.results[0])
            }
            .store(in: &suscriptors)
    }
    
    func getComicTesting() {
        self.comic = .comicPreview
    }
}
