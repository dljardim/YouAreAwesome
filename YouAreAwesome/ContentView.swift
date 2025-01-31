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
    @State private var messageContentView = "ContentView child"
    
    
    var body: some View {

        // can be changed
        var messageBody = "Body child"
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("This changes")
                .fontWeight(Font.Weight.heavy)
                .font(Font.title)
            
            Text(messageBody)

            // trailing closure
            Button("Click Me!"){
                // direct children of the ContentView:View struct cannot be changed by the struct
                messageContentView = "Awesome View"
                
                // the messageBody is not a direct child of the ContentView:View so it can be changed.
                messageBody = "Awesome Body"
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

