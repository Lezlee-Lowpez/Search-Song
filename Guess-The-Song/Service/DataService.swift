//
//  DataService.swift
//  Guess-The-Song
//
//  Created by Lesley Lopez on 9/17/24.
//

import Foundation

struct DataService {
    

    
    func getMusic(access_token: String, artist: String) async -> [Track] {
        
        // turn artist string into correct format if theres spaces
        var encodedQuery = artist.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        if let url = URL(string: "https://api.spotify.com/v1/search?q=\(encodedQuery ?? "test")&type=track") {
            
            
            //url request
            var request = URLRequest(url: url)
            request.setValue("Bearer \(access_token)", forHTTPHeaderField: "Authorization")
            
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
//                print(data)
                
                //decode it
                let decoder = JSONDecoder()
                
                let results = try decoder.decode(TrackResponse.self, from: data)
                return results.tracks.items ?? []
                
                
                
            } catch {
                print(error)
            }
           
        }
        
       return []
    }
}
