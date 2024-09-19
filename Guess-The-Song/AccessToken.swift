//
//  AccessToken.swift
//  Guess-The-Song
//
//  Created by Lesley Lopez on 9/19/24.
//

import Foundation

struct AccessToken : Codable {
    var access_token: String
    var token_type: String
    var expires_in: Int
}





struct TrackResponse : Codable {
    var tracks: TrackObject
}

struct TrackObject: Codable {
        var href: String?
        var limit: Int?
        var next: String?
        var offset: Int?
        var total: Int?
        var items: [Track]?
}

struct Track : Codable, Identifiable {
    
    // you can set the id as a unique property you already have
    var id: String { uri }
    
        var name: String
        var popularity: Int
        var preview_url: String?
        var uri: String
}
