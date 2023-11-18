//
//  ComicView.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import SwiftUI

struct ComicView: View {
    @StateObject var viewModel = ComicViewModel()
    var body: some View {
        switch viewModel.status {
        case .loading:
            LoadingView()
        case .loaded:
            ComicContentView(viewModel: viewModel)
        case .error(error: let error):
            Text(error)
        }
    }
}

#Preview {
    ComicView()
}
