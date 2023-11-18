//
//  SerieView.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import SwiftUI

struct SerieView: View {
    @StateObject var viewModel = SerieViewModel()
    var body: some View {
        switch viewModel.status {
        case .loading:
            LoadingView()
        case .loaded:
            //vista del detalle de la serie
            SerieContentView(viewModel: viewModel)
        case .error(error: let error):
            Text(error)
        }
    }
}

#Preview {
    SerieView()
}
