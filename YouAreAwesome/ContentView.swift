//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Damian Jardim on 1/26/25.
//


import SwiftUI

struct ContentView: View {
    
    // struct var cannot be changed unless we add it to state
    // private access modifier -
    @State private var messageNumber:Int = 0
    let messages: [String] = ["You are Awesome!",
                                             "You are amazing!",
                                             "You are incredible!",
                                             "Good on you",
                                             "Way to Go",
                                             "Incredible"]
    @State private var message = "";
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

            Button("Show Message"){
                
                message = messages[messageNumber]
                messageNumber += 1
                
                if(messageNumber > messages.count - 1){
                    messageNumber = 0
                }
             
                if(imageNumber > 9){
                    imageNumber = 0
                }
                
                imageString = "image\(imageNumber)"
                imageNumber += 1
              
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

