//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Damian Jardim on 1/26/25.
//



import SwiftUI
import AVFAudio

struct ContentView: View {
    
    // struct var cannot be changed unless we add it to state
    // private access modifier -
    @State private var messageNumber:Int = 0
    
    @State private var message = "";
    @State private var imageNumber = 0
    @State private var imageString = "image"
    
    // implicitly unwrapping nils
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundName = "sound"
    let numberOfImages = 9
    
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
                
                
                
                // repeat - imageString
                var nextImageRepeat = "image\(String(Int.random(in:0...numberOfImages)))"
                repeat{
                    nextImageRepeat = "image\(String(Int.random(in:0...numberOfImages)))"
                } while(nextImageRepeat == imageString)
                imageString = nextImageRepeat
                
                // repeat loop - messages
                var nextMessageRepeat = messages[(Int.random(in:0...(messages.count-1)))]
                repeat{
                    nextMessageRepeat = messages[(Int.random(in:0...(messages.count-1)))]
                } while(nextMessageRepeat == message)
                message = nextMessageRepeat
                
                
                // get the name of the next sound to play
                var nextSoundName = ""
                repeat{
                    nextSoundName = "sound\(String(Int.random(in:0...5)))"
                } while(soundName == nextSoundName)
                soundName = nextSoundName
                
                // check if that file exists and can be played
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("😡 Could not read file name \(soundName)")
                    return
                }
                
                // play the sound
                do{
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                }catch{
                    print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
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

