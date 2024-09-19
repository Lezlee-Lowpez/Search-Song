//
//  DataService.swift
//  Guess-The-Song
//
//  Created by Lesley Lopez on 9/17/24.
//

import Foundation

struct DataService {
    
//    var access_token = "BQB0DLHjaYEXKDqUrdP_GV319BKOW1NH361WjcnLS_k-pzx_lGRupPhQ6ZZk2AaqRrOyp1Dlix7MrKJZ_qErBezJ159Vd6QMQQAiMsp3R8ncZnZRPH0"
    
    func getMusic(access_token: String) async -> [Track] {
        
        //api key
        
        //url
        
        if let url = URL(string: "https://api.spotify.com/v1/search?q=bad%20bunny&type=track") {
            
            
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
