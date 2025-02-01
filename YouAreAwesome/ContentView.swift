//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Damian Jardim on 1/26/25.
//
// .tint vs .foregroundStyle
// .tint - interactive elements buttons and switches

import SwiftUI

struct ContentView: View {
    
    // struct var cannot be changed unless we add it to state
    // private access modifier -
    @State private var message = ""
    @State private var imageName = ""
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            
            Button("Press Me!"){
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                let image1 = "hand.thumbsup"
                let image2 = "sun.max.fill"
                
                if(message == message1){
                    message = message2
                    imageName = image2
                } else {
                    message = message1
                    imageName = image1
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

