//
//  HeroCard2View.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import SwiftUI

struct HeroCard2View: View {
    var hero: Hero
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "\(hero.thumbnail.path)\(hero.thumbnail.extensionPath)")) { Image in
                Image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } placeholder: {
                Image(systemName: "photo")
            }
            
            Text(hero.name)
                .font(.title2)
                .bold()
                .padding(.leading)

        }
    }
}

#Preview {
    HeroCard2View(hero: .heroPreview)
}
