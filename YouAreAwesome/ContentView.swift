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
    @State private var imageNumber = 0
    @State private var imageString = "image"
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(imageString)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 30)
                            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Spacer()
            
            Text(imageString)
            Text(String(imageNumber))
            Button("Show Message"){
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                
                message = ( message == message1 ? message2 : message1)
                
                if(imageString == "image" || imageString == "image9"){
                    imageNumber = 0
                    imageString = "image" + String(imageNumber)
                } else{
                    imageNumber += 1
                    imageString = "image" + String(imageNumber)
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

