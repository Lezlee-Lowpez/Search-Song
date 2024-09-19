//
//  ListView.swift
//  Guess-The-Song
//
//  Created by Lesley Lopez on 9/19/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var searchModel : SearchViewModel
    
    var body: some View {
        
        List {
            ForEach(searchModel.tracks) { track in
                HStack{
                    Text(track.name)
                    Spacer()
                    ImageView(url: track.album.images.first?.url ?? "")
                }
               
                
            }
        }
    }
}

#Preview {
    ListView()
}
