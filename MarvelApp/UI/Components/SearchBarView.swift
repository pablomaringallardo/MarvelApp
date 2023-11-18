//
//  SearchBarView.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import SwiftUI

struct SearchBarView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var searchBar: String = ""
    @FocusState var isFocused: Bool
    var body: some View {
        TextField("", text: $searchBar)
            .padding(.leading, 28)
            .padding(8)
            .background(
                .ultraThinMaterial
            )
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading, 8)
                    Text(!searchBar.isEmpty ? "" : "Buscar")
                    Spacer()
                    
                    Button {
                        searchBar = ""
                        isFocused.toggle()
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .padding(.trailing, 8)
                    }
                    .opacity(isFocused ? 1 : 0)
                }
                .onTapGesture {
                    isFocused.toggle()
                }
                .foregroundStyle(.black.opacity(0.6))
            }
            .focused($isFocused)
            .animation(.spring, value: isFocused)
            .onChange(of: searchBar) { _, newValue in
                //ha cambiado el filtro de busqueda
                viewModel.getHeros(filterName: newValue)
            }
    }
}

#Preview {
    ZStack {
        Color.black
        SearchBarView()
    }
}

