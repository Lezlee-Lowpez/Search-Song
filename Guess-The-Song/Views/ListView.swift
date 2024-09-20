//
//  ListView.swift
//  Guess-The-Song
//
//  Created by Lesley Lopez on 9/19/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var searchModel : SearchViewModel
    @Binding var previewOn: Bool
    
    var body: some View {
        
        
        
        
        List {
            ForEach(searchModel.tracks) { track in
                
                
                    HStack{
                        Text(track.name)
                            .frame(maxWidth:90, alignment: .leading)
                            .lineLimit(2)
                            .truncationMode(.tail)
                        Spacer()
                        ImageView(url: track.album.images.first?.url ?? "")
                        
                        if previewOn, let previewUrl = track.preview_url {
                            AudioPlayerView(previewUrl: previewUrl)
                        }
                        
                    }
                
                
                
               
               
                
            }
        }
    }
}

#Preview {
    ListView(previewOn: .constant(true))
}
