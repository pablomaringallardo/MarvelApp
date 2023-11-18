//
//  ComicContentView.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import SwiftUI
import CachedAsyncImage

struct ComicContentView: View {
    @StateObject var viewModel: ComicViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let comic = viewModel.comic {
                    
                    //imagen
                    CachedAsyncImage(url: URL(string: "\(comic.thumbnail.path)\(comic.thumbnail.extensionPath)"), urlCache: .imageCache, content: { Image in
                        Image
                            .resizable()
                            .frame(height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }, placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .foregroundStyle(.gray)
                    })
                    
                    //nombre del comic
                    Text(comic.title)
                        .font(.title)
                        .bold()
                    
                    //descripcion
                    if let description = comic.description {
                        Text(description)
                    } else {
                        Text("No description available")
                            .foregroundStyle(.gray)
                            .italic()
                    }
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Prices 💵")
                            .font(.title)
                            .bold()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(comic.prices ?? [], id: \.self) { price in
                                HStack {
                                    Text(price.type ?? "")
                                        .textCase(.uppercase)
                                        .bold()
                                        .font(.title3)
                                    Text("\(Double(price.price ?? 0.0).formatted(.number))$")
                                    
                                }
                            }
                        }
                    }
                    
                    Divider()
                    
                    //Creadores
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Creators 👥")
                            .font(.title)
                            .bold()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            ForEach(comic.creators?.items ?? [], id: \.self) { i in
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
    ComicContentView(viewModel: ComicViewModel(testing: true))
}
