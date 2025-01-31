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
    @State private var message = "Great"
    
    var body: some View {

        VStack {
            Spacer()
            
            
            
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .frame(width: 100, height: 100)

            
            Text(message)
                .fontWeight(Font.Weight.ultraLight)
                .font(Font.title)
                .foregroundStyle(.black)
            Spacer()
            HStack{
               
                Button("Awesome"){
                    message = "Awesome"
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .font(.title2)
                
                Button("Great"){
                    message = "Great"
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .font(.title2)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

