//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Damian Jardim on 1/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, eeee!")
                .fontWeight(Font.Weight.heavy)
                .padding(61)
                .font(Font.title)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

