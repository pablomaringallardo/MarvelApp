//
//  LaunchView.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import SwiftUI

struct LaunchView: View {
    @Binding var launchViewChange: Bool
    var body: some View {
            Image("fondoLogin")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            launchViewChange.toggle()
                        }
                    }
                }
        
    }
}

#Preview {
    LaunchView(launchViewChange: .constant(false))
}
