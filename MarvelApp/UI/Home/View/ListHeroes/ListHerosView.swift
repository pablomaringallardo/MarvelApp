//
//  ListHerosView.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import SwiftUI

struct ListHerosView: View {
    @StateObject var viewModel: HomeViewModel
    @State var filterSearchBar: String = ""
    var body: some View {
        NavigationStack {
            List {
                if let heros = viewModel.heros {
                    ForEach(heros) { hero in
                        NavigationLink {
                            DetailView(hero: hero)
                        } label: {
                            HeroCardView(hero: hero)
                        }
                    }
                }
            }
            .navigationTitle("Heroes de Marvel")
            .searchable(text: $filterSearchBar)
            .onChange(of: filterSearchBar) { _, newValue in
                if newValue.count >= 3 {
                    viewModel.getHeros(filterName: newValue)
                } else {
                    viewModel.getHeros(filterName: "")
                }
            }
        }
    }
}

#Preview {
    ListHerosView(viewModel: HomeViewModel())
}
