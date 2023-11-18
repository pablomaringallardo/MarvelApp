//
//  HomeView.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        switch viewModel.status {
        case .loading:
            LoadingView()
        case .loaded:
            ListHerosView(viewModel: viewModel)
        case .error(error: let error):
            Text(error)
        }
    }
}

#Preview {
    HomeView()
}
