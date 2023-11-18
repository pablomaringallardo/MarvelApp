//
//  LoadingView.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .opacity(0.8)
            
            VStack {
                Image("iconLoading")
                    .resizable()
                .frame(width: 150, height: 150)
                
                Text("Cargando...")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .bold()
                
                
            }
        }
    }
}

#Preview {
    LoadingView()
}
