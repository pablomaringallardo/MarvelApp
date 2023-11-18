//
//  SerieContentView.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import SwiftUI
import CachedAsyncImage

struct SerieContentView: View {
    @ObservedObject var viewModel: SerieViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let serie = viewModel.serie {
                    //imagen
                    CachedAsyncImage(url: URL(string: "\(serie.thumbnail.path)\(serie.thumbnail.extensionPath)"), urlCache: .imageCache) { Image in
                        Image
                            .resizable()
                            .frame(height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .foregroundStyle(.gray)
                    }
                    
                    //nombre de la serie
                    Text(serie.title)
                        .font(.title)
                        .bold()
                    
                    //descripcion
                    if let description = serie.description {
                        Text(description)
                    } else {
                        Text("No description available")
                            .foregroundStyle(.gray)
                            .italic()
                    }
                    
                    Divider()
                    
                    
                    //Creadores
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Creators 👥")
                            .font(.title)
                            .bold()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            ForEach(serie.creators?.items ?? [], id: \.self) { i in
                                HStack {
                                    Text(i.role ?? "")
                                        .textCase(.uppercase)
                                        .bold()
                                        .font(.title3)
                                        
                                    Text(i.name ?? "")
                                }
                                
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding()
        }
    }
}

#Preview {
    SerieContentView(viewModel: SerieViewModel(testing: true))
}
