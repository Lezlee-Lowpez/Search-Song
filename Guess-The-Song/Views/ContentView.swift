//
//  ContentView.swift
//  Guess-The-Song
//
//  Created by Lesley Lopez on 9/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var song = ""
    @EnvironmentObject var searchModel: SearchViewModel
    @State var previewOn = false
    
    var body: some View {
        
        ZStack{
            
            Color(red:84/255, green:13/255, blue: 110/255, opacity: 0.9)
            
            VStack {
                
                Text("Search For a Song")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.top,50)
                
                
                HStack {
                    TextField("Search a Song", text: $song)
                        .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    
                    Button(action: {
                        searchModel.callForData(artist: song)
                    }, label: {
                        Text("Go")
                            .frame(width: 40,height: 40)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    })
                    .padding(.trailing)
                }
                
                VStack(spacing: 0) {
                    Toggle("With Preview", isOn: $previewOn)
                }
                .bold()
                .foregroundStyle(.white)
                .padding(10)
                .background(Color(red: 115/255, green: 221/255, blue: 128/255))
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                .padding(.horizontal)
                
                
                
                ListView(previewOn: $previewOn)
                    .environmentObject(searchModel)
                
                
                
            }
        }
        .ignoresSafeArea()
        .onAppear {
            searchModel.callForData(artist: "bad bunny")
        }
    
    }
}

#Preview {
    ContentView()
}
