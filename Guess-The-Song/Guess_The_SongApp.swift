//
//  Guess_The_SongApp.swift
//  Guess-The-Song
//
//  Created by Lesley Lopez on 9/17/24.
//

import SwiftUI

@main
struct Guess_The_SongApp: App {
    @State var searchModel = SearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(searchModel)
        }
    }
}
