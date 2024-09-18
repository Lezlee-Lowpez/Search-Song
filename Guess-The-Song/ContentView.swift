//
//  ContentView.swift
//  Guess-The-Song
//
//  Created by Lesley Lopez on 9/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var song = ""
    
    var body: some View {
        
        ZStack{
            
            Color(red:84/255, green:13/255, blue: 110/255, opacity: 0.9)
            
            VStack {
                
                Text("Search For a Song")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                
                
                HStack {
                    TextField("Search a Song", text: $song)
                        .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    
                    Button(action: {
                       //code
                    }, label: {
                        Text("Go")
                            .background(.white)
                    })
                }
                
               
                
                
                
            }
        }
        .ignoresSafeArea()
        
       
       
    }
}

#Preview {
    ContentView()
}
