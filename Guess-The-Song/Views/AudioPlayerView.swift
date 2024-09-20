//
//  AudioPlayerView.swift
//  Guess-The-Song
//
//  Created by Lesley Lopez on 9/19/24.
//

import SwiftUI
import AVFoundation

struct AudioPlayerView: View {
    
    //idk about all this private stuff for observation pattern
    @State private var player : AVPlayer?
    @State var isPlaying = false
    var previewUrl : String
    
    var body: some View {
        
        VStack {
            if let url = URL(string: previewUrl){
                
                Button(action: {
                    if isPlaying {
                        stopAudio()
                        print("pause")
                    } else {
                        playAudio(from: url)
                        isPlaying = true
                        print("play")
                    }
                   
                }, label: {
                    Text(isPlaying ? "Pause" : "Play")
                })
                .frame(width:40, height: 40)
                .foregroundStyle(.white)
                .background(Color(red:84/255, green:13/255, blue: 110/255, opacity: 0.9))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
               
                
            } else{
                Text("Invalid url")
            }
        }
        
       
    }
    
    func playAudio(from url: URL) {
        player = AVPlayer(url: url)
        player?.play()
    }
    
    func stopAudio() {
        player?.pause()
    }
}

#Preview {
    AudioPlayerView(previewUrl: "https://p.scdn.co/mp3-preview/c377f6470d101b013892150833610b288951ea00?cid=cfe923b2d660439caf2b557b21f31221")
}
