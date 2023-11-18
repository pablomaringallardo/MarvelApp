//
//  MarvelAppApp.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import SwiftUI

@main
struct MarvelAppApp: App {
    @State var launchViewChange: Bool = false
    var body: some Scene {
        WindowGroup {
            if launchViewChange {
                HomeView()
            } else {
                LaunchView(launchViewChange: $launchViewChange)
            }
        }
    }
}
