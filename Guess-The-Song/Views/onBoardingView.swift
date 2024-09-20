//
//  onBoardingView.swift
//  Guess-The-Song
//
//  Created by Lesley Lopez on 9/17/24.
//

import SwiftUI

struct onBoardingView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var selectedViewIndex = 0
    var body: some View {
        
        ZStack{
            
            if selectedViewIndex == 0 {
                
                Color(red: 115/255, green: 221/255, blue: 128/255)
            } else{
                Color(red: 179/255, green: 188/255, blue: 250/255)
            }
            
            
            TabView(selection: $selectedViewIndex) {
                //first screen
                VStack{
                    Spacer()
                    Image("song")
                        .padding(.bottom, 30)
                    Text(" Find your jam, preview it, and let the music take over. 🎶💫")
                        .padding(.vertical)
                    
                    Spacer()
                    Button(action: {
                        withAnimation {
                            selectedViewIndex = 1
                        }
                        
                    }, label: {
                        Text("next")
                            .frame(width: 50, height: 30)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    })
                    .padding(.bottom, 100)
                   
                }
                .tag(0)
                .ignoresSafeArea()
                
                //second screen
                
                VStack{
                    Spacer()
                    Image("purp")
                        .padding(.leading, 10)
                        .padding(.bottom)
                        
                    Text("Just need the song name? No problem! You can toggle the preview off and on.")
                        .padding(.vertical)
                    
                    Spacer()
                    Button(action: {
                    
                            dismiss()
                        
                        
                    }, label: {
                        Text("back")
                            .frame(width: 50, height: 30)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    })
                    .padding(.bottom, 100)
                }
                .tag(1)
                .ignoresSafeArea()
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    onBoardingView()
}
