//
//  SearchViewModel.swift
//  Guess-The-Song
//
//  Created by Lesley Lopez on 9/19/24.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    // this one is going to keep the data for me
     @Published var tracks = [Track]()
    //call to fill the data
    var spotify = SpotifyAccess()
    var dataService = DataService()
    
    func callForData(artist:String) {
        Task {
            let fetchedTracks = await dataService.getMusic(access_token: spotify.getAccessToken(), artist: artist)
            
            DispatchQueue.main.async {
                self.tracks = fetchedTracks
            }
        }
    }
    
}
