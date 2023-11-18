//
//  HeroCardView.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import SwiftUI
import CachedAsyncImage

struct HeroCardView: View {
    var hero: Hero
    var body: some View {
        VStack(spacing: 0) {
            CachedAsyncImage(url: URL(string: "\(hero.thumbnail.path)\(hero.thumbnail.extensionPath)"), urlCache: .imageCache) { Image in
                Image
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding()
                    
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .foregroundStyle(.gray)
                    .padding()
            }
            Text(hero.name)
                .font(.title)
                .bold()
                .lineLimit(1)
        }
        .tint(.black)
        .background(
            .ultraThinMaterial
                .opacity(0.8)
            
        )
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .shadow(radius: 3, x: 8, y: 8)
    }
}


#Preview {
    HeroCardView(hero: .heroPreview)
}
