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
 
    @State private var message = "";
    @State private var imageNumber = 0
    @State private var imageString = "image"
    
    var body: some View {
        
        VStack {
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value:message)
            
            Image(imageString)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 30)
                .animation(.default, value:imageString)
            
            Spacer()
            
            Button("Show Message"){
                
                let messages: [String] = ["You are Awesome!",
                                          "You are amazing!",
                                          "If I were judging you from 1 to 10. You are most definately an Eleven",
                                          "You are incredible!",
                                          "Good on you",
                                          "Way to Go",
                                          "Incredibly Incredible"]
                

                // while loop - inside loop only runs on conditional
                var nextImageWhile = "image\(String(Int.random(in:0...9)))"
                while(imageString == nextImageWhile){
                    nextImageWhile = "image\(String(Int.random(in:0...9)))"
                }
                imageString = nextImageWhile
                
                
                // repeat - inside of repeat is executed at least ONCE
                var nextImageRepeat = "image\(String(Int.random(in:0...9)))"
                repeat{
                    nextImageRepeat = "image\(String(Int.random(in:0...9)))"
                } while(nextImageRepeat == imageString)
                imageString = nextImageRepeat
                          
                print("imageString:",nextImageRepeat)
                
                
                // while loop - messages
                var nextMessageWhile = messages[(Int.random(in:0...(messages.count-1)))]
                while(message == nextMessageWhile){
                    nextMessageWhile = messages[(Int.random(in:0...(messages.count-1)))]
                }
                message = nextMessageWhile
                
                // repeat loop - messages
                var nextMessageRepeat = messages[(Int.random(in:0...(messages.count-1)))]
                repeat{
                    nextMessageRepeat = messages[(Int.random(in:0...(messages.count-1)))]
                } while(nextMessageRepeat == message)
                message = nextMessageRepeat
         
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

