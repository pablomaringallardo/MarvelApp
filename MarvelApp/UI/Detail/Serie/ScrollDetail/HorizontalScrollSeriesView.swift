//
//  HorizontalScrollSeriesView.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import SwiftUI

struct HorizontalScrollSeriesView: View {
    @StateObject var viewModel = SerieViewModel()
    var hero: Hero
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(hero.series.items, id: \.self) { serie in
                    NavigationLink {
                        SerieView(viewModel: viewModel)
                            .onAppear {
                                viewModel.getSerie(url: serie.resourceURI)
                            }
                            .onDisappear {
                                viewModel.serie = nil
                            }
                    } label: {
                        ZStack {
                            Image("fondoSeries")
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
                            Text(serie.name)
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
    HorizontalScrollSeriesView(hero: .heroPreview)
}
