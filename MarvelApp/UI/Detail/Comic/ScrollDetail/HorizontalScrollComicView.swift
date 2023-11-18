//
//  HorizontalScrollComicView.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import SwiftUI

struct HorizontalScrollComicView: View {
    @StateObject var viewModel = ComicViewModel()
    var hero: Hero
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(hero.comics.items, id: \.self) { comic in
                            NavigationLink {
                                ComicView(viewModel: viewModel)
                                    .onAppear {
                                        viewModel.getComic(url: comic.resourceURI)
                                    }
                                    .onDisappear {
                                        viewModel.comic = nil
                                    }
                            } label: {
                                ZStack {
                                    
                                    Image("fondoComics")
                                        .resizable()
                                        .frame(width: 200, height: 80)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                        .id(0)
                                    
                                    Rectangle()
                                        .frame(width: 200, height: 80)
                                        .foregroundColor(.black)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                        .opacity(0.4)
                                        .id(1)
                                    
                                    Text(comic.name)
                                        .frame(width: 190, height: 70)
                                        .font(.title3)
                                        .bold()
                                        .foregroundStyle(.white)
                                        .id(2)
                                }
                            }
                        }
                    }
                }
            }
        }

#Preview {
    HorizontalScrollComicView(hero: .heroPreview)
}
