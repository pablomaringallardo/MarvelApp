//
//  DetailView.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import SwiftUI
import CachedAsyncImage

struct DetailView: View {
    var hero: Hero
    var body: some View {
        ScrollView {
            VStack {
                CachedAsyncImage(url: URL(string: "\(hero.thumbnail.path)\(hero.thumbnail.extensionPath)"), urlCache: .imageCache) { Image in
                    Image
                        .resizable()
                        .frame(height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(height: 300)
                        .foregroundStyle(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(hero.name)
                        .font(.title)
                        .bold()
                        .padding(.top)
                        .id(0)
                    
                    Text(hero.description)
                        .id(1)
                }
                
                
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Scroll horizontal series
                        Text("Series 🍿")
                            .font(.title2)
                            .bold()
                    
                    HorizontalScrollSeriesView(hero: hero)
                        
                    
                    // Scroll horizontal comics
                        Text("Comics 💥")
                            .font(.title2)
                            .bold()
                    
                    HorizontalScrollComicView(hero: hero)
                }
                .padding(.top)
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(hero.name)
        }
    }
}

#Preview {
    DetailView(hero: .heroPreview)
}
