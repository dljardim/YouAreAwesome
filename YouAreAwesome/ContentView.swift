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
    @State private var soundNumber = 0
    
    @State private var isOnAudio:Bool = true
    
    let numberOfSounds = 5
    let numberOfImages = 9
    
    func playSound(soundName:String){
        // check the toggle before playing
        if(!isOnAudio){
            return
        }
        
        if(audioPlayer != nil && audioPlayer.isPlaying){
            audioPlayer.stop()
        }
        
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
    
    
    func nonRepeatingRandom(lastNumber:Int, upperBounds:Int)->Int{
        
        var newRandomValue:Int = Int.random(in: 0...upperBounds)
        while(lastNumber == newRandomValue){
            newRandomValue = Int.random(in: 0...upperBounds)
        }
        return newRandomValue
    }
    
    
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
            
            HStack {
                
                // sound toggle
                HStack{
                    Text("Sound On:")
                    Toggle("", isOn: $isOnAudio)
                        .labelsHidden()
                        .onChange(of: isOnAudio){
                            audioPlayer.stop()
                        }
                }
                
                Spacer()
                
                Button("Show Message"){
                    
                    let messages: [String] = ["You are Awesome!",
                                              "You are amazing!",
                                              "If I were judging you from 1 to 10. You are most definately an Eleven",
                                              "You are incredible!",
                                              "Good on you",
                                              "Way to Go",
                                              "Incredibly Incredible"]
                    
                    // image to display
                    let nextImageRepeat = "image\(nonRepeatingRandom(lastNumber: imageNumber, upperBounds: numberOfImages))"
                    imageString = nextImageRepeat
                    
                    // message to display
                    let nextMessageRepeat = messages[(nonRepeatingRandom(lastNumber:messageNumber, upperBounds: messages.count-1))]
                    message = nextMessageRepeat
                    
                    // play sound - toggle
                    if(isOnAudio){
                        let nextSoundNumber = nonRepeatingRandom(lastNumber: soundNumber, upperBounds: numberOfSounds-1)
                        soundNumber = nextSoundNumber
                        
                        playSound(soundName: "sound\(soundNumber)")
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .tint(.accentColor)
        }
        .padding()
    }
}

#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.light)
}
