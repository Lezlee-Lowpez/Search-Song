//
//  SpotifyAccess.swift
//  Guess-The-Song
//
//  Created by Lesley Lopez on 9/17/24.
//

import Foundation

struct SpotifyAccess {
    
    //this is where im going to do OAuth
    //get an access token
    
    func getAccessToken() async {
        
        guard let client_id = Bundle.main.infoDictionary?["CLIENT_ID"] as? String,
              let client_secret = Bundle.main.infoDictionary?["CLIENT_SECRET"] as? String else {
            
            print("Missing client id or client secret in info.plist")
            return
        }
        
        if let url = URL(string: "https://accounts.spotify.com/api/token"){
            
            let credentials = "\(client_id):\(client_secret)"
            guard let encodedCredentials = credentials.data(using: .utf8)?.base64EncodedString() else {
                print("Failed to encode credentials")
                return
            }
            
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Basic \(encodedCredentials)", forHTTPHeaderField: "Authorization")
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            let bodyParams = "grant_type=client_credentials"
            request.httpBody = bodyParams.data(using: .utf8)
            
            do {
                var (data, response) = try await URLSession.shared.data(for: request)
//                print("This is the data:\(data)")
//                print("This is the response:\(response)")
                
                //decode it
                let decoder = JSONDecoder()
                let token = try decoder.decode(AccessToken.self, from: data)
                
                print("This is what i finally need: \(token)")
                
            } catch {
                print(error)
            }
            
           
            
        }

    }
}
