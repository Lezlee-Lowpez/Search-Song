//
//  ListView.swift
//  Guess-The-Song
//
//  Created by Lesley Lopez on 9/19/24.
//

import SwiftUI

struct ListView: View {
    
    var tracks : [Track]
    
    var body: some View {
        
        List {
            ForEach(tracks) { track in
                HStack{
                    Text(track.name)
                    Spacer()
                    Text("preview \(track.preview_url!)")
                }
               
                
            }
        }
    }
}

#Preview {
    ListView(tracks: [Track(name: "Tití Me Preguntó", popularity: 82, preview_url: ("https://p.scdn.co/mp3-preview/53a6217761f8fdfcff92189cafbbd1cc21fdb813?cid=2e5535e8dbd845dda042b2d0fe164d22"), uri: "spotify:track:1IHWl5LamUGEuP4ozKQSXZ"), Track(name: "PERRO NEGRO", popularity: 87, preview_url: ("https://p.scdn.co/mp3-preview/56ebd640e918ff135fed691da3c5697568e60a77?cid=2e5535e8dbd845dda042b2d0fe164d22"), uri: "spotify:track:7iQXYTyuG13aoeHxGG28Nh"), Track(name: "Me Porto Bonito", popularity: 84, preview_url: ("https://p.scdn.co/mp3-preview/5c80aedfe75d2bc15aa0e803993c43395d8054fe?cid=2e5535e8dbd845dda042b2d0fe164d22"), uri: "spotify:track:6Sq7ltF9Qa7SNFBsV5Cogx"), Track(name: "MONACO", popularity: 80, preview_url: ("https://p.scdn.co/mp3-preview/f80c7cc394457fc77cd6668a715b039fd86404f9?cid=2e5535e8dbd845dda042b2d0fe164d22"), uri: "spotify:track:4MjDJD8cW7iVeWInc2Bdyj")])
}
